part of 'cus_register_w_imports.dart';

class BuildRegisterForm extends StatelessWidget {
  final RegisterController controller;

  const BuildRegisterForm({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.vGap20,
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10).r,
            fieldTypes: FieldTypes.normal,
            controller: controller.email,
            focusBorderColor: cardColor,
            fillColor: Colors.grey.withOpacity(0.1),
            enableBorderColor: Colors.transparent,
            type: TextInputType.emailAddress,
            margin: Dimens.paddingHorizontal10PX,
            action: TextInputAction.next,
            validate: (value) => value!.validateEmail(),
            label: tr("email", context),
          ),
          Gaps.vGap20,
          GenericTextField(
            fillColor: Colors.grey.withOpacity(0.1),
            fieldTypes:  FieldTypes.password ,
            type: TextInputType.visiblePassword,
            focusBorderColor: cardColor,
            action: TextInputAction.done,
            controller: controller.password,
            enableBorderColor: Colors.transparent,
            validate: (value) => value!.validatePassword(),
            contentPadding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10).r,
            label: tr("password", context),
            margin: Dimens.paddingHorizontal10PX,
          ),
          Gaps.vGap20,
          GenericTextField(
            fillColor: Colors.grey.withOpacity(0.1),
            fieldTypes: FieldTypes.password ,
            type: TextInputType.visiblePassword,
            action: TextInputAction.done,
            enableBorderColor: Colors.transparent,
            focusBorderColor: cardColor,
            validate: (value) =>
                value!.validatePasswordConfirm(pass: controller.password.text),
            contentPadding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10).r,
            controller: controller.confirmPass,
            label: tr("confirmPassword", context),
            margin: Dimens.paddingHorizontal10PX,
          ),
        ],
      ),
    );
  }
}
