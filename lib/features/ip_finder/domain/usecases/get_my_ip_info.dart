import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';

import '../../../../core/usecases/use_case_my_ip.dart';
import '../enteties/ip.dart';
import '../repositories/ip_finder_repository.dart';

class GetMyIp implements UseCaseMyIp<IpEntety, NoParams>{
  GetMyIp(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpEntety>> call(NoParams noParams) async {
    return await ipFinderRepository.getMyIp();
  }
}

class GetMyIpInfo implements UseCaseMyIp<IpInfoEntety, Params>{
  GetMyIpInfo(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpInfoEntety>> call(Params params) async {
    return await ipFinderRepository.getMyIpInfo(params.ipString);
  }
}

class Params extends Equatable{
const Params({required this.ipString});
final String ipString;

@override
List<Object?> get props =>  [ipString];
}