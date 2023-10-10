// ignore_for_file: use_build_context_synchronously

part of 'login_imports.dart';

class LoginController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GenericBloc<bool> passwordVisible = GenericBloc(false);
  final GlobalKey<FormState> formKey = GlobalKey();

  Future signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      getIt.get<LoadingHelper>().showLoadingDialog();
      try {
        _setSignIn(context);
      } on FirebaseAuthException catch (e) {
        _handleException(context, e);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var data = await FirebaseAuth.instance.signInWithCredential(credential);
    log('========= Sign in with Google ==========');
    log(data.credential.toString());
    log('========================================');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),));
    return data ;
  }

  void _setSignIn(BuildContext context) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    if (credential.user != null) {
      _successDialog(context);
      getIt<LoadingHelper>().dismissDialog();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Home(),
      ));
    }
  }

  void _successDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Succes',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    ).show();
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
