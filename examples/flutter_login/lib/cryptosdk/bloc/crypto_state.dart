import 'package:equatable/equatable.dart';

abstract class CryptoState extends Equatable {
  @override
  List<Object> get props => [];
}

class CryptoUninitialized extends CryptoState {}

//UI:start key server
class CryptoKeyServer extends CryptoState {}

//UI:start key card
class CryptoKeyCard extends CryptoState {}

//UI:finished
class CryptoCompleted extends CryptoState {}

//UI:failure
class CryptoFailure extends CryptoState {}

//UI:cypto on-going....
class CryptoLoading extends CryptoState {}
