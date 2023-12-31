part of 'ip_finder_bloc.dart';

abstract class IpFinderState extends Equatable {
  const IpFinderState();
}

class EmptyState extends IpFinderState {
  @override
  List<Object> get props => [];
}

class LoadingState extends IpFinderState {
  @override
  List<Object> get props => [];
}

class LoadedState extends IpFinderState {
  LoadedState(this.ipInfoEntety);
  final IpInfoEntety ipInfoEntety;

  @override
  List<Object> get props => [ipInfoEntety];
}

class ErrorState extends IpFinderState {
  ErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}