import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputChecker{
  //Either<Failure, String>
  static void checkInput(String input){
    final List<String> exampleString = ['1','2','3','4','5','6','7','8','9','0',];
print('=------------------------------------------------------------------------------------------------------------=');
     int dots = 0;
     int groupNumber = 0;

     bool boolDots = false;
     bool boolNumbers = true;

    final String myInput = input.trim();
    final String myString = myInput.replaceAll(' ', '');
    final List<String> list = myString.split('');

    for(int i=0; i<list.length; i++){
      print(exampleString.any(list[i].contains));
      print(list[i]);

      if(boolNumbers){
        if(groupNumber == 3){
          boolNumbers = !boolNumbers;
          boolDots = !boolDots;
          groupNumber = 0;
          continue;
        }
          if(exampleString.any(list[i].contains)){
            groupNumber++;
          } else {
            boolNumbers = !boolNumbers;
            boolDots = !boolDots;
            groupNumber = 0;
          }
      }

      if(boolDots){
        if(dots == 1){
          boolNumbers = !boolNumbers;
          boolDots = !boolDots;
          dots = 0;
          continue;
        }
        if(list[i] == '.'){
          dots++;
        }else{
          print('Тотали Братан Момент');
        }
      }
    }

  }
}