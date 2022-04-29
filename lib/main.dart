import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_web_auth/flutter_web_auth.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = '';

  @override
  void initState() {
    super.initState();

  }


  void authenticate() async {
    final redirectUri =
    'com.googleusercontent.apps.566470595427-qfoaa5mgoa2i0h6qlps36m5n3r0gqhfg';
    final url = "https://accounts.google.com/o/oauth2/v2/auth?" +
    'scope=profile%20email%20https://www.googleapis.com/auth/gmail.readonly%20https://www.googleapis.com/auth/gmail.modify%20https://www.googleapis.com/auth/gmail.compose%20https://www.googleapis.com/auth/gmail.send&' +
    'response_type=code&' +
    'redirect_uri=' +
    '$redirectUri:/&' +
    'client_id=' +
    '566470595427-qfoaa5mgoa2i0h6qlps36m5n3r0gqhfg.apps.googleusercontent.com';

    try {
      final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: redirectUri);
      setState(() { _status = 'Got result: $result'; });
    } on PlatformException catch (e) {
      setState(() { _status = 'Got error: $e'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Status: $_status\n'),
              const SizedBox(height: 80),
              ElevatedButton(
                child: Text('Authenticate'),
                onPressed: () { authenticate(); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}