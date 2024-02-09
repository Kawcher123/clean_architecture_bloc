
import 'package:clean_architecture_bloc/data_layer/repositories/advice_repo_impl.dart';
import 'package:clean_architecture_bloc/domain_layer/entities/advice_entity.dart';
import 'package:clean_architecture_bloc/domain_layer/failures/failures.dart';
import 'package:clean_architecture_bloc/domain_layer/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  final AdviceRepo adviceRepo;

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
    // space for business logic
  }
}