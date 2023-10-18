import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/models/dash_board_model.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:chatgpt_course/res.dart';
import 'package:chatgpt_course/screens/dash_board/dash_board_imports.dart';
import 'package:chatgpt_course/screens/home/tabs/more/more_cubit/more_cubit.dart';
import 'package:chatgpt_course/screens/home/tabs/more/widgets/more_w_imports.dart';
import 'package:chatgpt_course/screens/privacy_policy/privacy_policy_imports.dart';
import 'package:chatgpt_course/screens/review/review_imports.dart';
import 'package:chatgpt_course/screens/splash/splash_imports.dart';
import 'package:chatgpt_course/screens/terms/terms_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

import '../../../../core/themes/app_text_style.dart';

part 'more.dart';
