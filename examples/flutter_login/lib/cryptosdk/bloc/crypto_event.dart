import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

//ui->bloc: start keyserver, key card
class CryptoIn extends CryptoEvent {
  final String token;
  //some other parameters....

  const CryptoIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'CryptoIn { token: $token }';
}

//ui->bloc
class CryptoOut extends CryptoEvent {}
