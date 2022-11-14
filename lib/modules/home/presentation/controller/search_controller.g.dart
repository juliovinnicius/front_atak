// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on _SearchBase, Store {
  late final _$listAtom = Atom(name: '_SearchBase.list', context: context);

  @override
  ObservableList<SearchEntity>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<SearchEntity>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchTextAsyncAction =
      AsyncAction('_SearchBase.searchText', context: context);

  @override
  Future searchText(String text) {
    return _$searchTextAsyncAction.run(() => super.searchText(text));
  }

  late final _$launchUrlAsyncAction =
      AsyncAction('_SearchBase.launchUrl', context: context);

  @override
  Future launchUrl(String text) {
    return _$launchUrlAsyncAction.run(() => super.launchUrl(text));
  }

  @override
  String toString() {
    return '''
list: ${list},
isLoading: ${isLoading}
    ''';
  }
}
