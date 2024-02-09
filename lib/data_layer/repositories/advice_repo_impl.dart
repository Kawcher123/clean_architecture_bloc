import 'package:clean_architecture_bloc/data_layer/datasources/advice_remote_datasource.dart';
import 'package:clean_architecture_bloc/data_layer/exceptions/exceptions.dart';
import 'package:clean_architecture_bloc/domain_layer/entities/advice_entity.dart';
import 'package:clean_architecture_bloc/domain_layer/failures/failures.dart';
import 'package:clean_architecture_bloc/domain_layer/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDatasource adviceRemoteDatasource;
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}