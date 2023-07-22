part of 'ip_finder_bloc.dart';

abstract class IpFinderEvent extends Equatable {
  const IpFinderEvent();
}

class GetMyIpInfoEvent extends IpFinderEvent{

  @override
  List<Object?> get props => throw UnimplementedError();
}