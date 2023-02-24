// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordViewModel on _PasswordViewModelBase, Store {
  late final _$isLockOpenAtom =
      Atom(name: '_PasswordViewModelBase.isLockOpen', context: context);

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  late final _$_PasswordViewModelBaseActionController =
      ActionController(name: '_PasswordViewModelBase', context: context);

  @override
  void isLockChange() {
    final _$actionInfo = _$_PasswordViewModelBaseActionController.startAction(
        name: '_PasswordViewModelBase.isLockChange');
    try {
      return super.isLockChange();
    } finally {
      _$_PasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLockOpen: ${isLockOpen}
    ''';
  }
}
