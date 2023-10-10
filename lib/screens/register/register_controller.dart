// ignore_for_file: use_build_context_synchronously

part of 'register_imports.dart';

class RegisterController {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmPass = TextEditingController();


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
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({
      "is_payment": false,
      "email": email.text,
      "device_id": await GetDeviceId().deviceId,
    });
    if (credential.user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Payment(),
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
        body:  Text(
          tr("emailISInUse", context),
          style: const AppTextStyle.s12_w500(color: Colors.black),
        ),
      );
    }
  }
}
