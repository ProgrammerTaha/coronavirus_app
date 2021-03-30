import 'package:flutter/material.dart';
import 'package:rest_api/app/services/api.dart';

import 'app/services/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  _updateAccessToken() async {
    APIService apiservice = APIService(API.sandbox());
    final accessToken = await apiservice.getAccessToken();
    setState(() {
      _accessToken = accessToken;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app')),
      body: Center(
        child: Text(_accessToken),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
      ),
    );
  }
}
