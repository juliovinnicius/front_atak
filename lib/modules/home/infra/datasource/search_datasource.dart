import 'package:front_atak/modules/home/infra/model/search_model.dart';

abstract class SearchDatasource {
  Future<SearchModel> getList(String text);
}
