import 'package:equatable/equatable.dart';

class IpEntety extends Equatable{
  IpEntety({required this.ip});
  final String ip;

  @override
  List<Object?> get props => [ip];
}