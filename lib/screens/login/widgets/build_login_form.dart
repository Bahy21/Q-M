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
            fillColor:Colors.grey.withOpacity(0.1),
            contentPadding: Dimens.paddingAll10PX,
            enableBorderColor: Colors.transparent,
            margin: Dimens.paddingHorizontal15PX,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value) => value!.validateEmail(),
            label: "Email",
          ),
          Gaps.vGap20,
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: controller.passwordVisible,
            builder: (context, state) {
              return GenericTextField(
                controller: controller.password,
                fillColor: Colors.grey.withOpacity(0.1),
                fieldTypes: state.data? FieldTypes.normal : FieldTypes.password,
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                validate: (value) => value!.validatePassword(),
                enableBorderColor: Colors.transparent,
                contentPadding: Dimens.paddingAll10PX,
                suffixIcon: GestureDetector(
                  onTap: () => controller.passwordVisible.onUpdateData(!state.data),
                  child: Icon(
                    state.data ?Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                ),
                label: "Password",
                margin: Dimens.paddingHorizontal15PX
              );
            },
          ),
        ],
      ),
    );
  }
}
