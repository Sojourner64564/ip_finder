import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/core/usecases/use_case_my_ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';
import 'package:ip_finder/features/ip_finder/domain/repositories/ip_finder_repository.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/params/params.dart';


@lazySingleton
class GetMyIpInfo implements UseCaseMyIp<IpInfoEntety, Params>{
  GetMyIpInfo(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpInfoEntety>> call(Params params) async {
    return await ipFinderRepository.getMyIpInfo(params.ipString);
  }
}
