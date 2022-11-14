import 'package:front_atak/modules/home/domain/entities/search_entity.dart';
import 'package:front_atak/modules/home/domain/errors/errors.dart';
import 'package:front_atak/modules/home/domain/usecases/search_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'search_controller.g.dart';

class SearchController = _SearchBase with _$SearchController;

abstract class _SearchBase with Store {
  final SearchUsecase _searchUsecase;

  @observable
  ObservableList<SearchEntity>? list;

  @observable
  bool isLoading = false;

  _SearchBase(this._searchUsecase);

  @action
  searchText(String text) async {
    isLoading = true;

    var result = await _searchUsecase(text);

    result.fold((l) => SearchError(), (r) => list = r!.asObservable());

    isLoading = false;
  }

  @action
  launchUrl(String text) async {
    if (!await launchUrl(text)) {
      throw 'Could not launch $text';
    }
  }
}
