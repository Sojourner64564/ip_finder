import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:ip_finder/core/data_sources/ip_finder_remote_data_source/ip_finder_remote_data_source.dart';
import '../../../../core/error/exceptions.dart';
import '../models/ip_info_model.dart';
import '../models/ip_model.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IpFinderRemoteDataSource)
class IpFinderRemoteDataSourceImpl implements IpFinderRemoteDataSource {
  IpFinderRemoteDataSourceImpl();


  @override
  Future<IpModel> getIp() async {
    final response = await http.get(
      Uri.parse('https://api.ipify.org/?format=json'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return IpModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<IpInfoModel> getIpInfo(String ipString) async {
    final response = await http.get(
      Uri.parse('https://ipinfo.io/$ipString/geo'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return IpInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

/*
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
  Future<IpInfoModel> getIpInfo(String ipString) async{
    final url = Uri.parse('https://ipinfo.io/$ipString/geo');
    final request = await httpClient.getUrl(url);
    final response = await request.close();
    if(response.statusCode == 401){
      throw ServerException();
    }
    final myJson = (await response.transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v))) as Map<String, dynamic>;
    final ipInfoResponseModel = IpInfoModel.fromJson(myJson);
    return ipInfoResponseModel;
  }
 */
