part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AviceRequestedEvent extends AdvicerEvent {}