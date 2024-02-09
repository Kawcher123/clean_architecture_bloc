

import 'package:clean_architecture_bloc/domain_layer/entities/advice_entity.dart';
import 'package:clean_architecture_bloc/domain_layer/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo
{
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}