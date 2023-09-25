import 'package:dio/dio.dart';

class SpotifyRepo{
  Future<Response> getMusic () async{
    final response = await Dio().get('https://api.spotify.com/v1/me/top/tracks?limit=50');
    print(response);
    return response;
  }
}
void main(){
  SpotifyRepo().getMusic();
}