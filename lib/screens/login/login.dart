// ignore_for_file: library_private_types_in_public_api

part of 'login_imports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const BuildAuthAppBar(),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            const BuildLoginHeader(),
            BuildLoginForm(controller: controller),
            BuildLoginButton(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: const BuildRegisterBtn(),
    );
  }
}