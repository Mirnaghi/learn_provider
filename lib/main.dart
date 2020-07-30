import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String data = 'data';

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Center(
            child: LevelOne(),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class LevelOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.blue,
      child: Center(
        child: Column(
          children: <Widget>[Text('Level 1'), LevelTwo(),],
        ),
      ),
    );
  }
}

class LevelTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Level 2'),
            TextField(
              onChanged: ((String value){
                Provider.of<Data>(context).changeData(value);
              }),
            ),
            LevelThree(),
          ],
        ),
      ),
    );
  }
}

class LevelThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Level 3'),
            Text(Provider.of<Data>(context).data),
          ],
        ),
      ),
    );
  }
}


class Data extends ChangeNotifier{
  String data = 'data in Data';

  void changeData(String newText){
    data = newText;
    notifyListeners();
  }
}