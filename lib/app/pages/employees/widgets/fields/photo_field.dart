import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/alert_dialog.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/camera_dialog.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';

class PhotoField extends StatelessWidget {
  const PhotoField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final imagePicker = ImagePicker();
            final XFile? image;
            var result = await cameraDialog(context);
            if (result != null) {
              try {
                image = await imagePicker.pickImage(source: result == 'Galery' ? ImageSource.gallery : ImageSource.camera);
                if (image != null) {
                  final Directory applicationDirectory = await getApplicationDocumentsDirectory();
                  final String fileName = '${applicationDirectory.path}/${image.name}';
                  await image.saveTo(fileName);
                  if (context.mounted) {
                    context.read<EmployeeRepo>().photo = image.name;
                  }
                }
              } catch (e) {
                var message = 'Unknown error.';
                if (e is PlatformException) {
                  message = e.message ?? 'Unknown error.';
                }
                if (context.mounted) {
                  result = await alertDialog(context, message);
                }
              }
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 168.h,
                height: 168.h,
                decoration: context.watch<EmployeeRepo>().photo.isNotEmpty
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12.h),
                        image: DecorationImage(
                            image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${context.read<EmployeeRepo>().photo}')),
                            fit: BoxFit.cover),
                      )
                    : ShapeDecoration(
                        color: dayBaseBase_03,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
                      ),
              ),
              if (context.read<EmployeeRepo>().photo.isEmpty) ...[
                SvgPicture.asset('assets/icons/Upload.svg', width: 24.w, height: 24.h),
              ] else ...[
                Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: SvgPicture.asset('assets/icons/Close.svg', width: 24.w, height: 24.h),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
