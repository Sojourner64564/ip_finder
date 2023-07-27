import 'dart:convert';
import 'dart:io';

import '../../../../core/error/exceptions.dart';
import '../models/ip_info_model.dart';
import '../models/ip_model.dart';
import 'package:http/http.dart' as http;

abstract class IpFinderRemoteDataSource{
Future<IpModel> getIp();
Future<IpInfoModel> getIpInfo();
}

class IpFinderRemoteDataSourceImpl implements IpFinderRemoteDataSource{
  IpFinderRemoteDataSourceImpl({required this.client});

  final http.Client client;
  final httpClient = HttpClient();


  @override
  Future<IpModel> getIp() async{
    final url = Uri.parse('https://api.ipify.org/?format=json');
      final request = await httpClient.getUrl(url);
      final response = await request.close();
      if (response.statusCode == 401){
        throw ServerException();
      }
      final myJson = (await response.transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then<dynamic>((v) => json.decode(v))) as Map<String, dynamic>;
      final ipResponseModel = IpModel.fromJson(myJson);
      return ipResponseModel;
  }

  @override
  Future<IpInfoModel> getIpInfo() {
    // TODO: implement getIpInfo
    throw UnimplementedError();
  }

}

/*
*   final url = Uri.parse( // нужен еще апи кей
        'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=$locale&page=$page'); //https://api.themoviedb.org/3/movie/popular?language=ru-RU&page=1
    try{
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response.jsonDecode() as Map<String, dynamic>;
      _validateResponse(response, json);
      final popularMovieResponse = PopularMovieResponse.fromJson(json);
      return popularMovieResponse;
    } on SocketException{
      throw ApiClientException(ApiClientExcptionType.Network);
    } on ApiClientException{
      rethrow;
    } catch(_){
      ApiClientException(ApiClientExcptionType.Other);
    }
  }
*/

/*
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) => _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() => _getTriviaFromUrl('http://numbersapi.com/random');


  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client.get(Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200){
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
 */