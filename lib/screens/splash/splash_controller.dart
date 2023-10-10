// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

part of 'splash_imports.dart';

class SplashController {
  var now = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> handleUserPayment(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;
    var data = await firestore.collection("users").doc(user!.uid).get();
    var parsedUser = UserModel.fromJson(data.data()!);
    if (parsedUser.isPayment == true) {
      if (parsedUser.paymentType == "week") {
        _handleWeekPayment(parsedUser, context);
      } else if (parsedUser.paymentType == "monthly") {
        _handleMonthPayment(parsedUser, context);
      } else if (parsedUser.paymentType == "yearly") {
        _handleYearPayment(parsedUser, context);
      }
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(),
      ));
    }
  }

  void _handleWeekPayment(UserModel user, BuildContext context) {
    if (user.paymentDate!.day == now.day - 3 ||
        user.paymentDate!.isBefore(
          DateTime(
            now.year,
            now.month,
            now.day - 3,
          ),
        )) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(),
      ));
    }
  }

  void _handleMonthPayment(UserModel user, BuildContext context) {
    if (user.paymentDate!.month == now.month - 1 ||
        user.paymentDate!.isBefore(
          DateTime(
            now.year,
            now.month - 1,
            now.day,
          ),
        )) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    }
  }

  void _handleYearPayment(UserModel user, BuildContext context) {
    if (user.paymentDate!.year == now.year - 1 ||
        user.paymentDate!.isBefore(
          DateTime(
            now.year - 1,
            now.month,
            now.day,
          ),
        )) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    }
  }

  void manipulateSaveData(BuildContext context) async {
    bool isLogin = FirebaseAuth.instance.currentUser != null;
    if (isLogin) {
      handleUserPayment(context);
      Future.delayed(Duration(seconds: 1), () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ));
    } else {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const Login(),
          ),
        );
      });
    }
  }
}
