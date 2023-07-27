import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../bloc/ip_finder_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  return Text(state.ipEntety.ip.toString());
                }else if(state is ErrorState){
                  return Text('errorState');
                }else{
                  return Text('bruh');
                }
              }
          ),
          const Text('^^^^^^^^^^^'),
          const SizedBox(height: 20),
          ButtonWidget(),
          const SizedBox(height: 20),
          const TextField(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {

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
        BlocProvider.of<IpFinderBloc>(context).add(GetMyIpInfoEvent());
      },
      child: const Text('Посмотреть свой IP'),
    );
  }
}