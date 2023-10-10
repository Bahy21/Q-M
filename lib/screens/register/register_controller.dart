// ignore_for_file: use_build_context_synchronously

part of 'register_imports.dart';

class RegisterController {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  GenericBloc<bool> visiblePassword = GenericBloc(false);
  GenericBloc<bool> citiesVisible = GenericBloc(false);
  GenericBloc<bool> termsBloc = GenericBloc(false);

  Future signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      getIt.get<LoadingHelper>().showLoadingDialog();
      try {
        _setRegister(context);
      } on FirebaseAuthException catch (e) {
        _handleException(context, e);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  void _setRegister(BuildContext context) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    if (credential.user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
    getIt<LoadingHelper>().dismissDialog();
  }

  void _handleException(BuildContext context, dynamic e) {
    if (e.code == 'weak-password') {
      getIt<LoadingHelper>().dismissDialog();
      AwesomeDialog(
        context: context,
        title: "Error",
        body: const Text(
          'Password is week',
          style: AppTextStyle.s12_w500(color: Colors.black),
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      getIt<LoadingHelper>().dismissDialog();
      AwesomeDialog(
        context: context,
        title: "Error",
        body: const Text(
          'Email is already in use',
          style: AppTextStyle.s12_w500(color: Colors.black),
        ),
      );
    }
  }
}
