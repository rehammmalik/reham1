import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'prov_con.dart';

class ProvScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterProvider>().count;

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$counterValue',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
