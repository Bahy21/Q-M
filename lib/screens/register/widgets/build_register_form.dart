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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: Dimens.paddingHorizontal15PX,
            fieldTypes: FieldTypes.normal,
            controller: controller.email,
            type: TextInputType.emailAddress,
            margin: Dimens.paddingHorizontal10PX,

            action: TextInputAction.next,
            validate: (value) => value?.validateEmail(),
            label: "Email",
          ),
          Gaps.vGap20,
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: controller.visiblePassword,
            builder: (context, state) {
              return GenericTextField(
                fillColor: Colors.grey.withOpacity(0.1),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                controller: controller.password,
                validate: (value) => value!.validatePassword(),
                contentPadding: Dimens.paddingHorizontal15PX,
                label: "Password",
                margin: Dimens.paddingHorizontal10PX,
                suffixIcon: InkWell(
                  onTap: () =>
                      controller.visiblePassword.onUpdateData(!state.data),
                  child: Icon(
                    state.data
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          Gaps.vGap20,
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: controller.visiblePassword,
            builder: (context, state) {
              return GenericTextField(
                fillColor: Colors.grey.withOpacity(0.1),
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                validate: (value) => value!.validatePasswordConfirm(pass: controller.password.text),
                contentPadding: Dimens.paddingHorizontal15PX,
                controller: controller.confirmPass,
                label: "Confirm password",
                margin: Dimens.paddingHorizontal10PX,
                suffixIcon: InkWell(
                  onTap: () =>
                      controller.visiblePassword.onUpdateData(!state.data),
                  child: Icon(
                    state.data
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
