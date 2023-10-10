import 'package:flutter/material.dart';
import 'package:login_tutorial/core/themes/app_text_style.dart';

class BuildAuthAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BuildAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      title: const Text('Sign in', style: AppTextStyle.s16_w700(color: Colors.black),),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
