import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/data/services/dialog.service.dart';

///
abstract class BaseViewModel<T extends ViewState> extends ChangeNotifier {
  ///
  T _state;

  bool _isDisposed = false;

  ///
  BaseViewModel(this._state);

  ///
  /// To get the state
  ///
  @nonVirtual
  T get state => _state;

  ///
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  ///
  void setState(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyListeners();
  }

  ///
  void showLoader(BuildContext context) {
    DialogService.injected().showLoadingDialog(context);
  }

  ///
  void hideLoader(BuildContext context) {
    DialogService.injected().hideLoadingDialog(context);
  }

  /// Read a viewmodel in context
  static T read<T>(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }

  /// Watch a viewmodel property in context
  static R select<T, R>(BuildContext context, R Function(T value) selector) {
    return context.select<T, R>(selector);
  }

  /// Watch a viewmodel in context
  static T watch<T>(BuildContext context) {
    return Provider.of<T>(context, listen: true);
  }
}

///
abstract class ViewState with EquatableMixin {
  ///
  const ViewState();
}
