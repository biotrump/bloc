import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/crypto.dart';

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
              Text('The key server is registering.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center
              ),
              RaisedButton(
                  onPressed: (){
                    BlocProvider.of<CryptoBloc>(context).add(CryptoOut());
                  },
                  child: Text('Next'),
                ),
              Container(
                  child: state is CryptoLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
            ],
          );
        },
      ),
    );
    //);
  }
}
