import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/crypto.dart';

//import 'package:flutter_login/validators.dart';
/*
class KeyServerForm extends StatefulWidget {
  @override
  State<KeyServerForm> createState() => _KeyServerFormState();
}

class _KeyServerFormState extends State<KeyServerForm> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocListener<CryptoBloc, CryptoState>(
      listener: (context, state) {
        //snackBar is bottom status
        if (state is CryptoKeyServer) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoKeyServer $state'),
              backgroundColor: Colors.red,
            ),
          );
        }

        //login progressing
        if (state is CryptoLoading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoLoading $state'),
              backgroundColor: Colors.green,
            ),
          );
        }

        //login progressing
        if (state is CryptoCompleted) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoCompleted $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }
        if (state is CryptoFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoFailure $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      child: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                ListView(
                  children: <Widget>[
                    Text("Welcome to use Trio. Your Trio Desktop PIN is xxxx.",
                      //style: TextStyle(fontSize: 25),
                      //textAlign: TextAlign.justify,
                    ),
                    Center(
                        child: RaisedButton(
                      child: Text('OK'),
                      onPressed: () {
                        //ui sends an event to bloc to go out congratulation page.
                        BlocProvider.of<CryptoBloc>(context).add(CryptoOut());
                      },
                    )),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/
/*
class KeyServerForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column (
        children:[
          ListView(
            children: <Widget>[
              Text("Welcome to use Trio. Your Trio Desktop PIN is xxxx.",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              Center(
                  child: RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  //ui sends an event to bloc to go out congratulation page.
                  BlocProvider.of<CryptoBloc>(context).add(CryptoOut());
                },
              )),
            ],
          ),
        ],
      );
  }
}
*/

class KeyServerForm extends StatefulWidget {

  @override
  State<KeyServerForm> createState() {
    return _KeyServerForm();
  }
}

class _KeyServerForm extends State<KeyServerForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CryptoBloc, CryptoState>(
      listener: (context, state) {
        //snackBar is bottom status
        if (state is CryptoKeyServer) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoKeyServer $state'),
              backgroundColor: Colors.red,
            ),
          );
        }

        //login progressing
        if (state is CryptoLoading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoLoading $state'),
              backgroundColor: Colors.green,
            ),
          );
        }

        //login progressing
        if (state is CryptoCompleted) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoCompleted $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }
        if (state is CryptoFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CryptoFailure $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      child: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('test'),
              RaisedButton(
                  onPressed: (){
                    BlocProvider.of<CryptoBloc>(context).add(CryptoOut());
                  },
                  child: Text('Next'),
                ),
            ],
          );
        },
      ),
    );
    //);
  }
}
