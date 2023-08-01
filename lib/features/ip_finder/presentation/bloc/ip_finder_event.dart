part of 'ip_finder_bloc.dart';

abstract class IpFinderEvent extends Equatable {
  const IpFinderEvent();
}

class GetMyIpInfoEvent extends IpFinderEvent{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetOtherIpInfoEvent extends IpFinderEvent{
  const GetOtherIpInfoEvent(this.otherIpString);

  final String otherIpString;

  @override
  List<Object?> get props => [otherIpString];
}