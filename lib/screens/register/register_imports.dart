import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatgpt_course/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/get_device_id.dart';
import 'package:chatgpt_course/core/helpers/loading_helper.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/screens/payment/payment_imports.dart';
import 'package:chatgpt_course/screens/register/widgets/cus_register_w_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'register.dart';
part 'register_controller.dart';