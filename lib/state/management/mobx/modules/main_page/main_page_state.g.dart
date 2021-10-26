// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_MainPageState on MainPageState, Store {
  final _$bannerUrlAtom = Atom(name: 'MainPageState.bannerUrl');

  @override
  String get bannerUrl {
    _$bannerUrlAtom.reportRead();
    return super.bannerUrl;
  }

  @override
  set bannerUrl(String value) {
    _$bannerUrlAtom.reportWrite(value, super.bannerUrl, () {
      super.bannerUrl = value;
    });
  }

  final _$initAsyncAction = AsyncAction('MainPageState.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
bannerUrl: ${bannerUrl}
    ''';
  }
}
