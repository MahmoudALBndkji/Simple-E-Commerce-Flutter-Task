import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class ChangeLanugageRow extends StatelessWidget {
  const ChangeLanugageRow({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<LanguageCubit>(context).changeLanguage("en");
            formKey.currentState?.reset();
          },
          child: Text(
            "English",
            style: TextStyles.font18BlackMedium(context)
                .copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(width: 15.0),
        const SizedBox(
          height: 17.0,
          child: VerticalDivider(color: Colors.grey),
        ),
        const SizedBox(width: 15.0),
        GestureDetector(
          onTap: () {
            BlocProvider.of<LanguageCubit>(context).changeLanguage("ar");
            formKey.currentState?.reset();
          },
          child: Text(
            "عربي",
            style: TextStyles.font18BlackMedium(
              context,
            ).copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
