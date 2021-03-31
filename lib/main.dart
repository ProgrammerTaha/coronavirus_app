import 'package:flutter/material.dart';
import 'package:rest_api/app/services/api.dart';

import 'app/services/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int? _cases;
  int? _casesSuspected;
  int? _casesConfirmed;
  int? _deaths;
  int? _recovered;
  String? _accessToken;
  _updateData() async {
    APIService apiservice = APIService(API.sandbox());
    final accessToken = await apiservice.getAccessToken();
    final cases = await apiservice.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.cases,
    );
    final casesSuspected = await apiservice.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.casesSuspected,
    );
    final casesConfirmed = await apiservice.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.casesConfirmed,
    );
    final deaths = await apiservice.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.deaths,
    );
    final recovered = await apiservice.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.recovered,
    );

    setState(() {
      _cases = cases;
      _casesSuspected = casesSuspected;
      _casesConfirmed = casesConfirmed;
      _recovered = recovered;
      _deaths = deaths;
      _accessToken = accessToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_accessToken != null)
              Text(
                'accessToken: $_accessToken',
                style: TextStyle(fontSize: 30),
              ),
            if (_cases != null)
              Text(
                'cases: $_cases',
                style: TextStyle(fontSize: 30),
              ),
            if (_casesSuspected != null)
              Text(
                'casesSuspected: $_casesSuspected',
                style: TextStyle(fontSize: 30),
              ),
            if (_casesConfirmed != null)
              Text(
                'casesConfirmed: $_casesConfirmed',
                style: TextStyle(fontSize: 30),
              ),
            if (_deaths != null)
              Text(
                'deaths: $_deaths',
                style: TextStyle(fontSize: 30),
              ),
            if (_recovered != null)
              Text(
                'recovered: $_recovered',
                style: TextStyle(fontSize: 30),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateData,
      ),
    );
  }
}
