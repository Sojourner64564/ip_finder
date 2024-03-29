
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ip_finder/core/usecases/use_case_my_ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/get_my_ip/get_my_ip.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/get_my_ip_info/get_my_ip_info.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/params/no_params.dart';
import 'package:ip_finder/features/ip_finder/domain/usecases/params/params.dart';

import '../../domain/enteties/ip.dart';


part 'ip_finder_event.dart';
part 'ip_finder_state.dart';

@lazySingleton
class IpFinderBloc extends Bloc<IpFinderEvent, IpFinderState> {
  IpFinderBloc(this.getMyIpInfo, this.getMyIp,
) : super(EmptyState()) {
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
    final ipInfoOrFailure = failureOrIpInfoEither.fold((failure) => ErrorState('thats a error over there'), (ipInfo) => LoadedState(ipInfo));
    emit(ipInfoOrFailure);
  }

  void _onGetOtherIpInfo(GetOtherIpInfoEvent event, Emitter<IpFinderState> state) async{
    emit(LoadingState());
    final String otherIpString = event.otherIpString;
    final failureOrIpOtherInfoEither = await getMyIpInfo.call(Params(ipString: otherIpString));
    final ipOtherInfoOrFailure = failureOrIpOtherInfoEither.fold((failure) => ErrorState('message'), (ipInfo) => LoadedState(ipInfo));
    emit(ipOtherInfoOrFailure);
  }


}
