part of 'register_imports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: const BuildAuthAppBar(),
        body: ListView(
          padding: Dimens.paddingHorizontal10PX,
          children: [
            BuildRegisterForm(
              controller: controller,
            ),
          ],
        ),
        bottomNavigationBar:  BuildCusRegister(
          controller: controller,
        ),
      ),
    );
  }
}
