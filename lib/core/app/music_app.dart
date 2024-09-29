import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:music_app/core/app/music_app_initial_bidings.dart';
import 'package:music_app/core/app/music_app_material.dart';
import 'package:music_app/core/app/routes/routes.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPages,
      initialRoute: Routes.genreList,
      initialBinding: MusicAppInitialBidings(),
    );
  }
}
