import 'package:dartz/dartz.dart';
import 'package:front_atak/modules/home/domain/entities/search_entity.dart';
import 'package:front_atak/modules/home/domain/errors/errors.dart';

abstract class SearchUsecase {
  Future<Either<FailureSearch, List<SearchEntity>?>> call(String text);
}
