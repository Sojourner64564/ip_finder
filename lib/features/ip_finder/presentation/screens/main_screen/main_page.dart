import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_finder/core/injectable/injectable.dart';
import 'package:ip_finder/features/ip_finder/presentation/screens/main_screen/text_output_widget.dart';

import '../../../../../core/util/input_checker.dart';
import '../../../../../injection_container.dart';
import '../../bloc/ip_finder_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  //final ipFinderBloc = sl<IpFinderBloc>();

  final newIpFinderBloc = getIt<IpFinderBloc>();

  @override
  Widget build(BuildContext context) {
    //InputChecker.checkInput('145.255.9.219');
    controller.text = '123.123.23.32';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<IpFinderBloc,IpFinderState>(
            bloc: newIpFinderBloc,
            builder: (context, state){
              if(state is EmptyState){
                return Text('emptyState');
              } else if(state is LoadingState){
                return Text('loadingState');
              }else if(state is LoadedState){
                return TextOutputWidget(ipInfoEntety: state.ipInfoEntety);
              }else if(state is ErrorState){
                return Text('errorState');
              }else{
                return Text('bruh');
              }
            }
        ),
        const Text('^^^^^^^^^^^'),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            newIpFinderBloc.add(GetMyIpInfoEvent());
          },
          child: const Text('Посмотреть свой IP'),
        ),
        const SizedBox(height: 20),
        TextField(
        controller: controller,
        ),
        TextButton(
          onPressed: () {
            newIpFinderBloc.add(GetOtherIpInfoEvent(controller.text));
          },
          child: const Text('Посмотреть другой IP'),
        ),

        const SizedBox(height: 20),
        //ButtonTwoWidget(),
      ],
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
        BlocProvider.of<IpFinderBloc>(context).add(GetMyIpInfoEvent());
       // sl<IpFinderBloc>().add(GetMyIpInfoEvent());
      },
      child: const Text('Посмотреть свой IP'),
    );
  }
}
/*
class ButtonTwoWidget extends StatelessWidget {
  const ButtonTwoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<IpFinderBloc>(context).add(GetOtherIpInfoEvent('123.123.23.32'));
        //sl<IpFinderBloc>().add(GetOtherIpInfoEvent(controller.text));
      },
      child: const Text('Посмотреть другой IP'),
    );
  }
}*/