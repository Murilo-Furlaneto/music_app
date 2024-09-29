import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/core/app/routes/routes.dart';
import 'package:music_app/features/genre_details/presentation/bidings/genre_details_bidings.dart';
import 'package:music_app/features/genre_details/presentation/screens/genre_details_screen.dart';
import 'package:music_app/features/genre_list/presentation/screens/genre_list_screen.dart';

class MusicAppMaterial {
  MusicAppMaterial._(); // comando para não instanciarem a classe

  static String get getTitle => "Music App";

  static List<GetPage> get getPages => [
        GetPage(
          name: Routes.genreList,
          page: () => const GenreListScreen(),
          binding: GenreDetailsBidings(),
          children: [
            GetPage(
              name: Routes.genreDetails,
              page: () => const GenreDetailsScreen(),
              binding: GenreDetailsBidings(),
            ),
          ],
        ),
      ];

  static ThemeData get getTheme => ThemeData(
        primaryColor: MusicAppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MusicAppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: MusicAppColors.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Nunito',
      );
}
