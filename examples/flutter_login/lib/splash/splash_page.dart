import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/authentication/authentication.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SplashPage(),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  bool agreeEula = false;
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
      //body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CheckboxListTile(
            value: agreeEula ?? false,//A ?? B : return A if non-null else
            onChanged: (value) {
              setState(() {//make widget updated by setState()
                agreeEula = value;
              });
            },
            title: GestureDetector(
                child: Text("I agree to the terms of I.X EULA",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
                onTap: () {
                  _launchURL();
                }),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          OutlineButton(
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
            onPressed: !agreeEula ? null : () {
              print('clicked!');
              //send a bloc event to load email sign up page
              BlocProvider.of<AuthenticationBloc>(context).add(EulaAgreed());
            },
            child: Text("Setup Trio"),
          ),
          Center(
            child: Text('Eula Screen'),
          ),
        ],
      );
      
      
    //);
  }

  //launch mobile brower
  _launchURL() async {
    const url =
        'https://trio.ix-security.com/trio-terms/?utm_source=TrioApp&utm_medium=app&utm_content=oobe';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

  }

}
