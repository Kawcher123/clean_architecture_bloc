import 'dart:async';

import 'package:clean_architecture_bloc/application_layer/pages/advice/cubit/advicer_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // execute business logic
      // for example get and advice
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(AdvicerStateLoaded(advice: 'fake advice to test bloc'));
    });
  }
}
