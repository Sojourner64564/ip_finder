import '../../domain/enteties/ip.dart';

class IpModel extends IpEntety{
  IpModel({
    required String ip,
}):super(ip: ip);

factory IpModel.fromJson(Map<String, dynamic> json){
  return IpModel(
      ip: json['ip'],
  );
}

Map<String, dynamic> toJson(){
  return {
    'ip': ip,
  };
}
}

