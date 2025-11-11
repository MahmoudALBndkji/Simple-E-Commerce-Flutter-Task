import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/view_model/authentication_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/auth_decoration_container.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/change_language_row.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/dont_have_account_widget.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/login_desktop_button.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/login_header_text.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/login_password_field.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/login_username_field.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/my_scroll_behavior.dart';

class LoginDesktopView extends StatefulWidget {
  const LoginDesktopView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginDesktopViewState();
}

class _LoginDesktopViewState extends State<LoginDesktopView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });
    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    usernameController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(service: ApiService()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Row(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: heightScreen(context)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: authDecorationContainer(),
                        child: Opacity(
                          opacity: _opacity.value,
                          child: Transform.scale(
                            scale: _transform.value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    AssetsImage.logo,
                                    width: 150.0,
                                    height: 150.0,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 80.0),
                                  width: widthScreen(context) * .9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.black.withValues(alpha: .1),
                                        blurRadius: 90,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Column(
                                      spacing: 15.0,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LoginHeaderText(),
                                        SizedBox(),
                                        LoginUserNameField(
                                          usernameController:
                                              usernameController,
                                        ),
                                        SizedBox(height: 5.0),
                                        LoginPasswordField(
                                          passwordController:
                                              passwordController,
                                        ),
                                        DontHaveAccountWidget(),
                                        ChangeLanugageRow(formKey: formKey),
                                        SizedBox(height: 5.0),
                                        LoginDesktopButton(
                                          formKey: formKey,
                                          usernameController:
                                              usernameController,
                                          passwordController:
                                              passwordController,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: authDecorationContainer(),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsImage.backgroundAuth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
