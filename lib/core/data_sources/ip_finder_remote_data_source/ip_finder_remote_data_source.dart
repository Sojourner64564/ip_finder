import 'package:ip_finder/features/ip_finder/data/models/ip_info_model.dart';
import 'package:ip_finder/features/ip_finder/data/models/ip_model.dart';

abstract class IpFinderRemoteDataSource {
  Future<IpModel> getIp();
  Future<IpInfoModel> getIpInfo(String ipString);
}