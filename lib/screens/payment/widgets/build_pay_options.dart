part of 'payment_w_imports.dart';

class BuildPayOptions extends StatelessWidget {
  final PaymentController controller;

  const BuildPayOptions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<PayOptions>, GenericState<PayOptions>>(
      bloc: controller.payOptionsBloc,
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.payOptionsBloc.onUpdateData(PayOptions.daysFree);
              },
              child: Container(
                padding:
                    const EdgeInsetsDirectional.only(start: 10, bottom: 10),
                decoration: state.data == PayOptions.daysFree
                    ? CustomDecoration().copyWith(
                        border: Border.all(
                          color: primaryColor,
                        ),
                      )
                    : CustomDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "3 days Free Trial, Auto Renewal",
                          style: AppTextStyle.s14_w600(
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: state.data == PayOptions.daysFree
                              ? BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: const Radius.circular(3),
                                    bottomStart:
                                        const Radius.circular(Dimens.dp24).r,
                                  ),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(5).r,
                                    bottomLeft:
                                        const Radius.circular(Dimens.dp24).r,
                                  ),
                                ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                                child: const Icon(
                                  Icons.done,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                              Gaps.hGap10,
                              const Text(
                                "No Payment Now",
                                style: AppTextStyle.s14_w600(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tr("weekSubscribe", context),
                      style: const AppTextStyle.s14_w600(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.vGap15,
            GestureDetector(
              onTap: () {
                controller.payOptionsBloc.onUpdateData(PayOptions.monthly);
              },
              child: Container(
                padding:
                const EdgeInsetsDirectional.only(start: 10, bottom: 10),
                decoration: state.data == PayOptions.monthly
                    ? CustomDecoration().copyWith(
                        border: Border.all(
                          color: primaryColor,
                        ),
                      )
                    : CustomDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Billed Once",
                          style: AppTextStyle.s14_w600(color: Colors.black),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Save 70 %",
                            style: AppTextStyle.s14_w600(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tr("monthSubscribe", context),
                      style: const AppTextStyle.s14_w600(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.vGap15,
            GestureDetector(
              onTap: () {
                controller.payOptionsBloc.onUpdateData(PayOptions.yearly);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 10, bottom: 10),
                decoration: state.data == PayOptions.yearly
                    ? CustomDecoration().copyWith(
                        border: Border.all(
                          color: primaryColor,
                        ),
                      )
                    : CustomDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Billed Once",
                          style: AppTextStyle.s14_w600(color: Colors.black),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Save 70 %",
                            style: AppTextStyle.s14_w600(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tr("yearSubscribe", context),
                      style: const AppTextStyle.s14_w600(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
