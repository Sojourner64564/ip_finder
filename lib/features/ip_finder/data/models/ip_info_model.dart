

import '../../domain/enteties/ip_Info.dart';

class IpInfoModel extends IpInfoEntety{
  IpInfoModel({
    required String ip,
    required String city,
    required String region,
    required String country,
    required String loc,
    required String org,
    required String timezone,
  }):super(
    ip: ip,
    city: city,
    region: region,
      country:country,
    loc:loc,
    org:org,
    timezone:timezone
  );

  factory IpInfoModel.fromJson(Map<String, dynamic> json){
    return IpInfoModel(
      ip: json['ip'],
      city: json['city'],
      region: json['region'],
      country: json['country'],
      loc: json['loc'],
      org: json['org'],
      timezone: json['timezone'],
    );
  }

 /* Map<String, dynamic> toJson(){
    return {
      'ip': ip,
    };
  }*/
}


