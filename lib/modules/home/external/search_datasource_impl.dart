import 'package:dio/dio.dart';
import 'package:front_atak/modules/home/domain/errors/errors.dart';

import 'package:front_atak/modules/home/infra/datasource/search_datasource.dart';
import 'package:front_atak/modules/home/infra/model/search_model.dart';

class SearchDatasourceImpl implements SearchDatasource {
  final Dio dio;
  SearchDatasourceImpl({required this.dio});

  @override
  Future<SearchModel> getList(String text) async {
    Response response = await dio.post(
      'http://192.168.0.9:3000/search',
      data: {
        "text": text,
      },
    );

    if (response.statusCode == 200) {
      final list = SearchModel.fromJson(response.data);

      return list;
    } else {
      throw DataSourceError();
    }
  }
}
