import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/services/audio_service/audio_player_service.dart';

class AudioPlayerServiceImpl implements AudioPlayerService {
  AudioPlayerServiceImpl(this.audioPlayer);

  final AudioPlayer audioPlayer;

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();

      return position?.inSeconds ?? 0;
    } catch (error, stackTrace) {
      const errorMessage = "Erro ao retornar a posição da música";
      log(errorMessage, error: error, stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }

  // retorna a posição (tempo) em que a musica esta. Exemplo: 0:50 sec
  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() {
    return callAudioPlayerServiceFunction(
        () => audioPlayer.pause(), 'Erro ao pausar a música');
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayerServiceFunction(
        () => audioPlayer.play(AssetSource(audioAsset)),
        'Erro ao carregar a música');
  }

  Future<void> callAudioPlayerServiceFunction(
      Future<void> Function() tryFunction, String audioPlayerException) async {
    try {
      return await tryFunction();
    } catch (error, stackTrace) {
      final errorMessage = audioPlayerException;
      log(errorMessage, error: error, stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceFunction(
        () => audioPlayer.resume(), 'Erro ao continuar música');
  }

  // Quando o usuário arrastar o tempo de musica para frente ou para trás
  @override
  Future<void> seek(int seconds) {
    return callAudioPlayerServiceFunction(() {
      final seekTo = Duration(seconds: seconds);

      return audioPlayer.seek(seekTo);
    }, 'Erro ao trocar duração da música');
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayerServiceFunction(
        () => audioPlayer.stop(), 'Erro ao parar a música');
  }
}
