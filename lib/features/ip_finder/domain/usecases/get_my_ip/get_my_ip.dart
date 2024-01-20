import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/core/usecases/use_case_my_ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip.dart';
import 'package:ip_finder/features/ip_finder/domain/repositories/ip_finder_repository.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/params/no_params.dart';


@lazySingleton
class GetMyIp implements UseCaseMyIp<IpEntety, NoParams>{
  GetMyIp(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpEntety>> call(NoParams noParams) async {
    return await ipFinderRepository.getMyIp();
  }
}