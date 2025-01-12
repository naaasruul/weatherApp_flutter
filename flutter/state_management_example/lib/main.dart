import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/example.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // put the provider at the very top
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context)=> Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}





class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<Data>(context).data),
    );
  }
}

class Data extends ChangeNotifier{

  String data = 'Some data';

  void changeString(String newString){
    data = newString;
    notifyListeners();
  }

}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue){
        print(newValue);
        Provider.of<Data>(context,listen: false).changeString(newValue);
      },
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}
