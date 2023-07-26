import 'package:dartz/dartz.dart';

import 'package:ip_finder/core/error/failures.dart';

import '../../../../core/usecases/use_case_my_ip.dart';
import '../enteties/ip.dart';
import '../repositories/ip_finder_repository.dart';

class GetMyIpInfo implements UseCaseMyIp<IpEntety>{
  GetMyIpInfo(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpEntety>> call() async {
    return await ipFinderRepository.getMyIp();
  }

}