import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/screens/home/tabs/chat_screen/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

part 'ocr.dart';
part 'ocr_controller.dart';
