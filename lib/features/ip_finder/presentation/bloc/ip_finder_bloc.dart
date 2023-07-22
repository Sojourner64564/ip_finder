
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';

import '../../domain/usecases/get_my_ip_info.dart';


part 'ip_finder_event.dart';
part 'ip_finder_state.dart';

class IpFinderBloc extends Bloc<IpFinderEvent, IpFinderState> {
  IpFinderBloc({
    required this.getMyIpInfo
}) : super(EmptyState()) {
    on<GetMyIpInfoEvent>(_onGetMyIpInfo);
  }

  final GetMyIpInfo getMyIpInfo;

  void _onGetMyIpInfo(GetMyIpInfoEvent event, Emitter<IpFinderState> state){
    emit(LoadingState());
    final failureOrIp =

  }
}
