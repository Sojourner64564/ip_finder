import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/ip_info_model.dart';
import '../models/ip_model.dart';
import 'package:http/http.dart' as http;


abstract class IpFinderRemoteDataSource{
Future<IpModel> getIp();
Future<IpInfoModel> getIpInfo(String ipString);
}

@Injectable(as: IpFinderRemoteDataSource)
class IpFinderRemoteDataSourceImpl implements IpFinderRemoteDataSource{
  IpFinderRemoteDataSourceImpl();

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

}

