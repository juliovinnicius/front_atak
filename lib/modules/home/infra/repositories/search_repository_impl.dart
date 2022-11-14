import 'package:dartz/dartz.dart';

import 'package:front_atak/modules/home/domain/entities/search_entity.dart';
import 'package:front_atak/modules/home/domain/errors/errors.dart';
import 'package:front_atak/modules/home/domain/repositories/search_repository.dart';
import 'package:front_atak/modules/home/infra/datasource/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl({required this.datasource});

  @override
  Future<Either<FailureSearch, List<SearchEntity>?>> getListSearch(String text) async {
    try {
      final result = await datasource.getList(text);
      return Right(result.body);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
