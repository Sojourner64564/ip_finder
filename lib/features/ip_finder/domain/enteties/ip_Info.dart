import 'package:equatable/equatable.dart';

class IpInfoEntety extends Equatable{
  IpInfoEntety({required this.ip,required this.city,required this.region,required this.country,required this.loc,required this.org,required this.timezone});
  final String ip;
  final String city;
  final String region;
  final String country;
  final String loc;
  final String org;
  final String timezone;

  @override
  List<Object?> get props => [
    ip,
  city,
  region,
  country,
  loc,
  org,
  timezone,
  ];
}