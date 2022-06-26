import 'package:flutter/material.dart';

class history_button extends StatelessWidget {
  const history_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic calculator'),
          backgroundColor: Colors.brown[900],
          actions: <Widget>[
            ListTile(
              title: new Text("Economics"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.pop(context);
              },
            ), //IconButton
          ],
        ),
      ),
    );
  }
}
