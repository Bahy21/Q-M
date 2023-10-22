// ignore_for_file: use_build_context_synchronously

part of 'select_lang_imports.dart';

class SelectLang extends StatefulWidget {
  const SelectLang({super.key});

  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  final SelectLangController controller = SelectLangController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
          "Select Lang",
          style: AppTextStyle.s14_w600(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<GenericBloc<String>, GenericState<String>>(
        bloc: controller.langBloc,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  tr("selectLanguage", context),
                  style: AppTextStyle.s24_w700(
                    color: primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.changeLanguage(context, "ar"),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: state.data == "ar"
                            ? primaryColor
                            : Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(25).r,
                  ),
                  child: Text(
                    tr("arabic", context),
                    style:  AppTextStyle.s14_w600(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Gaps.vGap10,
              GestureDetector(
                onTap: () => controller.changeLanguage(context, "en"),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: state.data == "en"
                            ? primaryColor
                            : Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(25).r,
                  ),
                  child: Text(
                    tr("english", context),
                    style:  AppTextStyle.s14_w600(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  var users = prefs.getString("users");
                  var emails = json.decode(users!);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Login(savedEmails: emails,),));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25).r,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    tr("confirm", context),
                    style:  AppTextStyle.s14_w600(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
