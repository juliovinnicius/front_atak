import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_atak/modules/home/presentation/controller/search_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  SearchController searchController = GetIt.I.get<SearchController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ATAK"),
        centerTitle: true,
        leading: Container(),
      ),
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          onPressed: () {
            searchController.searchText(controller.text);
          },
          child: searchController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.search),
        );
      }),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Observer(
            builder: (_) {
              return Column(
                children: [
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Digite o texto de busca',
                      label: const Text("Pesquisa"),
                      suffixIcon: InkWell(
                        onTap: () => controller.clear(),
                        child: const Icon(Icons.close),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  (searchController.list == null || searchController.list!.isEmpty)
                      ? const SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Text("Nenhum foi feito nenhum pesquisa"),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            itemCount: searchController.list!.length,
                            itemBuilder: (context, index) => Card(
                              // color: Theme.of(context).primaryColor.withOpacity(0.3),
                              child: InkWell(
                                onTap: () async {
                                  final Uri url = Uri.parse(searchController.list![index].link!);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            // color: Colors.red,
                                            child: Text(
                                              searchController.list![index].title!,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 300,
                                        // color: Colors.red,
                                        child: Text(
                                          searchController.list![index].link!,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
