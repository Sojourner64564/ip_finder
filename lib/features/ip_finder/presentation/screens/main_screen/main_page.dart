import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectBloc(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('fgfcg'),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {

            },
            child: Text('Посмотреть свой IP'),
          ),
          const SizedBox(height: 20),
          TextField(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {

            },
            child: Text('Посмотреть свой другой IP'),
          ),
        ],
      ),
    );
  }
}