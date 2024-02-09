
import 'package:clean_architecture_bloc/domain_layer/entities/advice_entity.dart';
import 'package:clean_architecture_bloc/domain_layer/failures/failures.dart';
import 'package:clean_architecture_bloc/domain_layer/use_cases/advice_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {


  final AdviceUseCases adviceUseCases;
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    // execute business logic
    // for example get and advice
    debugPrint('fake get advice triggered');
    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
            (failure) => emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
            (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
    debugPrint('got advice');
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server Failure Message';
      case CacheFailure:
        return 'cache Failure Message';
      default:
        return 'general Failure Message';
    }
  }
}