import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///
/// Sample
///
class RedBox with EquatableMixin{
  ///
  final Color color;

  ///
  final bool isSelected;

  ///
  const RedBox({this.color = Colors.red, this.isSelected = false});

  ///
  RedBox copyWith({Color? color, bool? isSelected}) {
    return RedBox(
        color: color ?? this.color, isSelected: isSelected ?? this.isSelected);
  }

  @override
  List<Object?> get props => <Object?>[color,isSelected];
}

///
class GreenBox with EquatableMixin{

  ///
  final Color color;

  ///
  final bool isSelected;

  ///
  const GreenBox({this.color = Colors.green, this.isSelected = false});

  ///
  GreenBox copyWith({Color? color, bool? isSelected}) {
    return GreenBox(
        color: color ?? this.color, isSelected: isSelected ?? this.isSelected);
  }

  @override
  List<Object?> get props => <Object?>[color,isSelected];
}
