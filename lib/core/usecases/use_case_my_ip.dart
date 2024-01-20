import 'package:ip_finder/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseMyIp<Type, TypeParams>{
  Future<Either<Failure, Type>> call(TypeParams params);
}

