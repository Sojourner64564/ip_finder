import 'package:ip_finder/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseMyIp<Type>{
  Future<Either<Failure, Type>> call();
}