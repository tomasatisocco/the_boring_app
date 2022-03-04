import 'package:equatable/equatable.dart';

class RandomActivity extends Equatable{
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String? key;
  final double accesibility;

  const RandomActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    this.key,
    required this.accesibility
  });

  @override
  List<Object?> get props => [
    activity,
    type,
    participants,
    price,
    link,
    key,
    accesibility
  ];
}