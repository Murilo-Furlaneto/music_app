import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:music_app/core/services/api_service.dart';
import 'package:music_app/core/services/audio_service/audio_player_service_impl.dart';
import 'package:music_app/core/services/dot_env-services.dart';

import '../shared/features/music_player/presentation/controllers/music_player_controller.dart';

class MusicAppInitialBidings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ApiService(BaseOptions(
        baseUrl: DotEnvServices.getApiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )),
    );

    Get.put(AudioPlayerServiceImpl());

    Get.lazyPut(() => MusicPlayerController());
  }
}
