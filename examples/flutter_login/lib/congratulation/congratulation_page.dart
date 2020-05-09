//
//  congratulation_page.dart
//  trio
//
//  Ported by Thomas Tsai 05/2020
//  Copyright © 2020 ix-security.com. All rights reserved.
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/authentication/authentication.dart';

class CongratulationPage extends StatelessWidget {
  CongratulationPage({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulation to Pin Page'),
      ),
      body: Column (
        children:[ 
          Center(
            child: RaisedButton(
              child: Text('Next'),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(SummaryIn());
              },
            )
          ),
          /*
          ListView(
            children: <Widget>[
              Text("Welcome to use Trio. Your Trio Desktop PIN is xxxx.",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              Center(
                  child: RaisedButton(
                child: Text('OK'),
                onPressed: () {
                  //ui sends an event to bloc to go out congratulation page.
                  //BlocProvider.of<AuthenticationBloc>(context).add(SummaryIn());
                },
              )),
            ],
          ),
          */
        ],
      ),
    );
  }
}

/*
class CongratulationPage extends StatefulWidget {
  @override
  State<CongratulationPage> createState() {
    return _CongratulationPage();
  }
}

class _CongratulationPage extends State<CongratulationPage> {
  bool terms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulation to Pin Page'),
      ),
      body: ListView(
        children: <Widget>[
          Text("Welcome to use Trio. Your Trio Desktop PIN is xxxx.",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.justify,
          ),
          Center(
              child: RaisedButton(
            child: Text('OK'),
            onPressed: () {
              //BlocProvider.of<Bloc<OOBEEvent, OOBEState>>(context).add(OOBEWelcomePinOKEvent());
              BlocProvider.of<OOBEBloc>(context).add(OOBEWelcomePinOKEvent());
            },
          )),
        ],
      ),
    );
  }
}
*/