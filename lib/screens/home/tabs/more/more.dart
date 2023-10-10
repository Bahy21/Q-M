// ignore_for_file: use_build_context_synchronously

part of 'more_imports.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool isAdmin = false;

  @override
  void initState() {
    checkIfItAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoreCubit();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(Res.logo),
          ),
          title: Text(
            tr("menu", context),
            style: const AppTextStyle.s16_w700(color: Colors.black),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Visibility(
                visible: isAdmin,
                child: BuildMoreItem(
                  title: tr("dashBoard", context),
                  icon: Icons.dashboard,
                  onTab: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DashBoard(),
                      ),
                    );
                  },
                ),
              ),
              BuildMoreItem(
                title: tr("rateApplication", context),
                icon: Icons.star_rate_outlined,
                onTab: () {},
              ),
              BuildMoreItem(
                title: tr("addReview", context),
                icon: Icons.reviews_outlined,
                onTab: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Review(),
                    ),
                  );
                },
              ),
              BuildMoreItem(
                title: tr("privacyPolicy", context),
                icon: Icons.privacy_tip_outlined,
                onTab: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
              ),
              BuildMoreItem(
                title: tr("lang", context),
                icon: Icons.language,
                onTab: () {

                },
              ),
              BuildMoreItem(
                title: tr("termsAndConditions", context),
                icon: Icons.account_balance_sharp,
                onTab: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Terms(),
                  ));
                },
              ),
              // BuildMoreItem(
              //   title: tr("reviews", context),
              //   icon: Icons.reviews_outlined,
              //   onTab: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const MyReviews(),
              //     ));
              //   },
              // ),
              BuildMoreItem(
                title: tr("logOut", context),
                icon: Icons.logout_outlined,
                onTab: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Splash(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkIfItAdmin() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var data =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();
    var parsedData = UserModel.fromJson(data.data()!);
    if (parsedData.isAdmin == true) {
      setState(() {
        isAdmin = true;
      });
    } else {
      isAdmin = false;
    }
  }
}
