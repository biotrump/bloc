//
//  congratulation_page.dart
//  trio
//
//  Ported by Thomas Tsai 05/2020
//  Copyright © 2020 ix-security.com. All rights reserved.
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/authentication/authentication.dart';

class SummaryPage extends StatelessWidget {
  final String username;

  SummaryPage({Key key, @required this.username})
      : assert(username != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Info'),
      ),
      body: Column (
        children:[ 
          Center(
            child: RaisedButton(
              child: Text('logout'),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            )
          ),
          /*
          ListView(
            children: <Widget>[
              Text("user account",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              Center(
                child: RaisedButton(
                  child: Text('logout'),
                  onPressed: () {
                    //ui sends an event to bloc to go out congratulation page.
                    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  },
                ),
              ),
            ],
          ),
          */
        ],
      ),
    );
  }
}
