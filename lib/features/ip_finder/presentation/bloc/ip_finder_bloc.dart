
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ip_finder/core/usecases/use_case_my_ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';

import '../../domain/enteties/ip.dart';
import '../../domain/usecases/get_my_ip_info.dart';


part 'ip_finder_event.dart';
part 'ip_finder_state.dart';

class IpFinderBloc extends Bloc<IpFinderEvent, IpFinderState> {
  IpFinderBloc({
    required this.getMyIpInfo,
    required this.getMyIp
}) : super(EmptyState()) {
    on<GetMyIpInfoEvent>(_onGetMyIpInfo);
    on<GetOtherIpInfoEvent>(_onGetOtherIpInfo);
  }

  final GetMyIp getMyIp;
  final GetMyIpInfo getMyIpInfo;

  void _onGetMyIpInfo(GetMyIpInfoEvent event, Emitter<IpFinderState> state) async{
    emit(LoadingState());
    final failureOrIpEither = await getMyIp.call(NoParams());
    final failureOrIp = failureOrIpEither.fold((failure) => ErrorState('bruh'), (ip) => (ip));
    if(failureOrIp is ErrorState){
      emit(failureOrIp);
      throw UnimplementedError();
    }
    final failureOrIpInfoEither = await getMyIpInfo.call(Params(ipString: (failureOrIp as IpEntety).ip));
    emit(failureOrIpInfoEither.fold((failure) => ErrorState('thats a error over there'), (ipInfo) => LoadedState(ipInfo)));
  }

  void _onGetOtherIpInfo(GetOtherIpInfoEvent event, Emitter<IpFinderState> state) async{
    emit(LoadingState());
    final otherIpString = event.otherIpString;
  }


}
