part of 'login_widgets_imports.dart';

class BuildLoginForm extends StatelessWidget {
  final LoginController controller;

  const BuildLoginForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.vGap50,
          GenericTextField(
            controller: controller.email,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: Dimens.paddingAll10PX,
            enableBorderColor: Colors.transparent,
            margin: Dimens.paddingHorizontal15PX,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value) => value!.validateEmail(),
            label: tr("email", context),
          ),
          Gaps.vGap20,
          GenericTextField(
              controller: controller.password,
              fillColor: Colors.grey.withOpacity(0.1),
              fieldTypes: FieldTypes.password,
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
              validate: (value) => value!.validateEmpty(),
              enableBorderColor: Colors.transparent,
              contentPadding: Dimens.paddingAll10PX,
              label: tr("password", context),

              margin: Dimens.paddingHorizontal15PX),
        ],
      ),
    );
  }
}
