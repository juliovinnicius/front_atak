import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:front_atak/modules/home/domain/entities/search_entity.dart';
import 'package:front_atak/modules/home/domain/errors/errors.dart';
import 'package:front_atak/modules/home/domain/repositories/search_repository.dart';
import 'package:front_atak/modules/home/domain/usecases/search_usecase.dart';

class SearchUsecaseImpl implements SearchUsecase {
  final SearchRepository repository;

  SearchUsecaseImpl({required this.repository});

  @override
  Future<Either<FailureSearch, List<SearchEntity>?>> call(String text) async {
    if (text.isEmpty) {
      return Left(InvalidSearchError());
    }
    return repository.getListSearch(text);
  }
}
