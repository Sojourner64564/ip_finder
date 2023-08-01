import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_finder/features/ip_finder/presentation/screens/main_screen/text_output_widget.dart';

import '../../../../../core/util/input_checker.dart';
import '../../../../../injection_container.dart';
import '../../bloc/ip_finder_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    InputChecker.checkInput('145.255.9.219');
    return BlocProvider(
      create: (BuildContext context) => sl<IpFinderBloc>(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<IpFinderBloc,IpFinderState>(
              builder: (context, state){
                if(state is EmptyState){
                  return Text('emptyState');
                } else if(state is LoadingState){
                  return Text('loadingState');
                }else if(state is LoadedState){
                  return TextOutputWidget(ipInfoEntety: state.ipInfoEntety,);
                }else if(state is ErrorState){
                  return Text('errorState');
                }else{
                  return Text('bruh');
                }
              }
          ),
          const Text('^^^^^^^^^^^'),
          const SizedBox(height: 20),
          const ButtonWidget(),
          const SizedBox(height: 20),
          TextField(
          controller: controller,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              sl<IpFinderBloc>().add(GetOtherIpInfoEvent(controller.text));
            },
            child: const Text('Посмотреть свой другой IP'),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
       // BlocProvider.of<IpFinderBloc>(context).add(GetMyIpInfoEvent());
        sl<IpFinderBloc>().add(GetMyIpInfoEvent());
      },
      child: const Text('Посмотреть свой IP'),
    );
  }
}