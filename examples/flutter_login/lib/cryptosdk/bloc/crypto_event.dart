import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

//ui->bloc: start keyserver, key card
class CryptoIn extends CryptoEvent {}

//ui->bloc
class CryptoOut extends CryptoEvent {}
