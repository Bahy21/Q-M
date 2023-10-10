// ignore_for_file: use_build_context_synchronously

part of 'add_request_widgets_imports.dart';

class BuildAddRequestImageDialog extends StatelessWidget {
  final AddRequestController controller ;
  const BuildAddRequestImageDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(
        vertical: AppConstants.padding30,
        horizontal: AppConstants.padding10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConstants.radius15,
        ),
      ),
      backgroundColor: context.colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () async{
              await controller.getImageFromCamera(context);
              Navigator.pop(context);
            },
            child: Container(

              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding10,
                vertical: AppConstants.padding10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: context.colors.black,
                    size: 15,
                  ),
                  Gaps.vGap5,
                  Text(
                    "Camera",
                    style: AppTextStyle.s12_w400(
                      color: context.colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Gaps.hGap32,
          GestureDetector(
            onTap: () async{
              await controller.getRequestImages(context);
              Navigator.pop(context);
            } ,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding10,
                vertical: AppConstants.padding10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: context.colors.black,
                    size: 15,
                  ),
                  Gaps.vGap5,
                  Text(
                    "Gallary ",
                    style: AppTextStyle.s12_w400(
                      color: context.colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
