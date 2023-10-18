// ignore_for_file: avoid_print, use_build_context_synchronously

part of 'payment_imports.dart';

class PaymentController {
  final GenericBloc<PayOptions> payOptionsBloc =
      GenericBloc(PayOptions.daysFree);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String getPaymentAmount() {
    if (payOptionsBloc.state.data == PayOptions.daysFree) {
      return "3.99";
    } else if (payOptionsBloc.state.data == PayOptions.monthly) {
      return "9.99";
    } else if (payOptionsBloc.state.data == PayOptions.yearly) {
      return "49.99";
    } else {
      return "";
    }
  }

  String getPaymentType() {
    if (payOptionsBloc.state.data == PayOptions.daysFree) {
      return "week";
    } else if (payOptionsBloc.state.data == PayOptions.monthly) {
      return "monthly";
    } else if (payOptionsBloc.state.data == PayOptions.yearly) {
      return "yearly";
    } else {
      return "";
    }
  }

  void handleDaysFreeSubscription(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;
    if (payOptionsBloc.state.data == PayOptions.daysFree) {
      await FirebaseFirestore.instance.collection("users").doc(user!.uid).set(
        {
          "payment_date": DateTime.now(),
          "payment_type": "week",
          "is_payment": true,
          "email": user.email,
          "device_id": await GetDeviceId().deviceId,
        },
      );
      var data = await firestore.collection("users").doc(user.uid).get();
      var parsedData = UserModel.fromJson(data.data()!);
      log("data :        \n ${parsedData.toJson()}");
    }
  }

  void onPayment(BuildContext context) async {
    handleDaysFreeSubscription(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
            sandboxMode: true,
            clientId:
                "Ac62hHhjjyv4cJUUXMF_ZnciVSF0YLzdi_bLtDgYLTK2JwEd-1woK_SPdOZi_DX2BdwJDIJtO8b07F-K",
            secretKey:
                "EKGmKp2--2FN-Bljo3T_BnWgmwJF3GgdQIpodxnAS1ulS0yApcdexuVrKCDz14dqUzvYn-cYbiyDiLer",
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [
              {
                "amount": {
                  "total": getPaymentAmount(),
                  "currency": "USD",
                  "details": {
                    "subtotal": getPaymentAmount(),
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    {
                      "name": "Q & A",
                      "quantity": 1,
                      "price": getPaymentAmount(),
                      "currency": "USD"
                    }
                  ],
                  "shipping_address": const {
                    "recipient_name": "Jane Foster",
                    "line1": "Travis County",
                    "line2": "",
                    "city": "Austin",
                    "country_code": "US",
                    "postal_code": "73301",
                    "phone": "+00000000",
                    "state": "Texas"
                  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              User? user = FirebaseAuth.instance.currentUser;
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(user!.uid)
                  .set({
                "payment_date": DateTime.now(),
                "payment_type": getPaymentType(),
                "is_payment": true,
                "email": user.email,
                "device_id": await GetDeviceId().deviceId,
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            },
            onError: (error) {
              print("onError: $error");
            },
            onCancel: (params) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            }),
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }
}
