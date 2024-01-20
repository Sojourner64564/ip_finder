import 'package:equatable/equatable.dart';

class Params extends Equatable{
  const Params({required this.ipString});
  final String ipString;

  @override
  List<Object?> get props =>  [ipString];
}