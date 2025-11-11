import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/design/size_config.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/text_field_with_title.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/view_model/cubit/settings_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/add_product_to_store_appbar.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/add_product_to_store_button.dart';

class AddProductToStoreView extends StatefulWidget {
  const AddProductToStoreView({super.key});

  @override
  State<AddProductToStoreView> createState() => _AddProductToStoreViewState();
}

class _AddProductToStoreViewState extends State<AddProductToStoreView> {
  XFile? image;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  Future pickImage(ImageSource source) async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;
    setState(() {
      image = pickedImage;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTableOrBigger =
        MediaQuery.sizeOf(context).width > SizeConfig.tablet;
    return BlocProvider(
      create: (context) => SettingsCubit(service: ApiService()),
      child: Scaffold(
        appBar: AddProductToStoreAppbar(),
        body: isTableOrBigger
            ? Row(
                children: [
                  Expanded(child: SizedBox.shrink()),
                  Expanded(child: addProductToStoreBody(context)),
                  Expanded(child: SizedBox.shrink()),
                ],
              )
            : addProductToStoreBody(context),
      ),
    );
  }

  Padding addProductToStoreBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 19.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithTitle(
                suffixIcon: Icon(Icons.text_fields),
                controller: titleController,
                title: "title".tr(context),
                hint: "enter_title".tr(context),
                validator: (input) =>
                    input!.isEmpty ? "field_validation".tr(context) : null,
              ),
              SizedBox(height: 5.0),
              TextFieldWithTitle(
                suffixIcon: Icon(Icons.money),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: priceController,
                title: "price".tr(context),
                hint: "enter_price".tr(context),
                validator: (input) =>
                    input!.isEmpty ? "field_validation".tr(context) : null,
              ),
              SizedBox(height: 5.0),
              TextFieldWithTitle(
                suffixIcon: Icon(Icons.date_range),
                controller: descriptionController,
                title: "description".tr(context),
                hint: "enter_description".tr(context),
                validator: (input) =>
                    input!.isEmpty ? "field_validation".tr(context) : null,
              ),
              SizedBox(height: 5.0),
              TextFieldWithTitle(
                suffixIcon: Icon(Icons.category_outlined),
                controller: categoryController,
                title: "category".tr(context),
                hint: "enter_category".tr(context),
                validator: (input) =>
                    input!.isEmpty ? "field_validation".tr(context) : null,
              ),
              SizedBox(height: 5.0),
              Row(
                spacing: 20.0,
                mainAxisAlignment: image != null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (ctx) => Wrap(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: Text(
                                'take_picture_from_camera'.tr(context),
                              ),
                              onTap: () {
                                Navigator.pop(ctx);
                                pickImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: Text(
                                'pick_pictures_from_gallery'.tr(context),
                              ),
                              onTap: () {
                                Navigator.pop(ctx);
                                pickImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "upload_image".tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: whiteColor, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                  if (image != null)
                    Center(
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: CircleAvatar(
                          radius: 500.0,
                          backgroundImage: FileImage(File(image!.path)),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              AddProductToStoreButton(
                formKey: formKey,
                product: ProductModel(
                  title: titleController.text,
                  price: num.tryParse(priceController.text) ?? 0,
                  description: descriptionController.text,
                  category: categoryController.text,
                  image: image?.path ?? "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
