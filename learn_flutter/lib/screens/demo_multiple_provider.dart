import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Demo 1

class Counter1 with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}

class DemoMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter1()),
        ChangeNotifierProvider(create: (_) => Counter2()),
      ],
      child: TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);

    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Text(
          'count1 = ${counter1.count.toString()} ; count2 = ${counter2.count.toString()}',
          style: TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  counter1.increment();
                },
                child: Text('increment1')),
            ElevatedButton(
                onPressed: () {
                  counter2.increment();
                },
                child: Text('increment2')),
            ElevatedButton(
                onPressed: () {
                  counter1.increment();
                  counter2.increment();
                },
                child: Text('All increment'))
          ],
        )
      ]),
    ));
  }
}

//Demo 2

class Counter3 {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
  }
}

class Counter4 {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
  }
}

class DemoMultipleProvider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter3>.value(value: Counter3()),
        Provider<Counter4>.value(value: Counter4()),
      ],
      child: TestWidget2(),
    );
  }
}

class TestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter3 counter3 = Provider.of<Counter3>(context,listen: false);
    Counter4 counter4 = Provider.of<Counter4>(context,listen: false);

    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Text(
          'count1 = ${counter3.count.toString()} ; count2 = ${counter4.count.toString()}',
          style: TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  counter3.increment();
                },
                child: Text('increment3')),
            ElevatedButton(
                onPressed: () {
                  counter4.increment();
                },
                child: Text('increment4')),
            ElevatedButton(
                onPressed: () {
                  counter3.increment();
                  counter4.increment();
                },
                child: Text('All increment'))
          ],
        )
      ]),
    ));
  }
}
