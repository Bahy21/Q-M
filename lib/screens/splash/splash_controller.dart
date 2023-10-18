// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

part of 'splash_imports.dart';

class SplashController {
  var now = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getApiKey(BuildContext context) async {
    var data = await firestore.collection("dashBoard").doc("dashBoard").get();
    var parsedData = DashBoardModel.fromJson(data.data()!);
    GlobalState.instance.set("api_key", parsedData.apiKey);
  }

  Future<void> handleUserPayment(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;
    var data = await firestore.collection("users").doc(user!.uid).get();
    var parsedUser = UserModel.fromJson(data.data()!);
    handleUserLang(parsedUser, context);
    if (parsedUser.isPayment == true) {
      if (parsedUser.paymentType == "week") {
        _handleWeekPayment(parsedUser, context);
      } else if (parsedUser.paymentType == "monthly") {
        _handleMonthPayment(parsedUser, context);
      } else if (parsedUser.paymentType == "yearly") {
        _handleYearPayment(parsedUser, context);
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Payment(),
        ),
      );
    }
  }

  void _handleWeekPayment(UserModel user, BuildContext context) async {
    log("data : \n${user.toJson()}");
    log(FirebaseAuth.instance.currentUser!.uid.toString());
    final DateTime date = user.paymentDate!.toDate();
    var uid = FirebaseAuth.instance.currentUser!.uid;
    if (date.day == now.day - 3 ||
        date.isBefore(
          DateTime(
            now.year,
            now.month,
            now.day - 3,
          ),
        )) {
      await FirebaseFirestore.instance.collection("users").doc(uid).update ({
        "payment_type": "week",
        "is_payment": false,
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Payment(),
        ),
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    }
  }

  void _handleMonthPayment(UserModel user, BuildContext context) async {
    final DateTime date = user.paymentDate!.toDate();
    var uid = FirebaseAuth.instance.currentUser!.uid;
    if (date.month == now.month - 1 ||
        date.isBefore(
          DateTime(
            now.year,
            now.month - 1,
            now.day,
          ),
        )) {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "payment_type": "monthly",
        "is_payment": false,
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    }
  }

  void _handleYearPayment(UserModel user, BuildContext context) async {
    final DateTime date = user.paymentDate!.toDate();
    var uid = FirebaseAuth.instance.currentUser!.uid;
    if (date.year == now.year - 1 ||
        date.isBefore(
          DateTime(
            now.year - 1,
            now.month,
            now.day,
          ),
        )) {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "payment_type": "yearly",
        "is_payment": false,
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),
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
      getApiKey(context);
      handleUserPayment(context);
      Future.delayed(
        Duration(seconds: 1),
        () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        ),
      );
    } else {
      getApiKey(context);
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Login(
              savedEmails: const [],
            ),
          ),
        );
      });
    }
  }

  void handleUserLang(UserModel user, BuildContext context) {
    if (user.lang != null) {
      context.read<LangCubit>().onUpdateLanguage(Locale(user.lang!));
    }
  }
}
