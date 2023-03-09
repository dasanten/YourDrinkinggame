import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/workshop_card_set_viewmodel.dart';

import '../../../component/tile/custom_workshop_card_set_tile.dart';

class WorkshopCardSetsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkshopCardSetsViewState();
}

class WorkshopCardSetsViewState extends State<WorkshopCardSetsView> {
  final ScrollController _scrollController = ScrollController();
  BuildContext? _buildContext;

  @override
  Widget build(BuildContext context) {
    this._buildContext = context;
    return Consumer<WorkshopCardSetViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading && !viewModel.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (viewModel.cardSetList.isNotEmpty) {
          return RefreshIndicator(
              onRefresh: viewModel.getWorkshopCardSets,
              child: Scaffold(
                  floatingActionButton: FloatingActionButton.small(
                    onPressed: viewModel.refresh,
                    tooltip: "refresh",
                    child: Icon(Icons.refresh),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  body: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: viewModel.searchQuery,
                          onFieldSubmitted: (query) => viewModel.search(query),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).backgroundColor,
                            label: Text(
                              "Suche",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            controller: _scrollController,
                            itemCount: viewModel.cardSetList.length +
                                (viewModel.isLoadingMore ? 3 : 0),
                            separatorBuilder: (_, index) => const Divider(),
                            itemBuilder: (context, i) {
                              if (i >= viewModel.cardSetList.length) {
                                return ListTile();
                              }
                              return CustomWorkshopCardSetTile(
                                cardSet: viewModel.cardSetList[i],
                                isLocal: viewModel.getCardSetLocalById(
                                  viewModel.cardSetList[i].id!,
                                ),
                              );
                            }),
                      ),
                    ],
                  )));
        } else if (viewModel.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Es konnte keien Verbindung zum Server hergestellt werden.'),
                _loadCardSetsButton(viewModel.refresh),
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Keine Sets gefunden.'),
              _loadCardSetsButton(viewModel.getWorkshopCardSets),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 100 >=
              _scrollController.position.maxScrollExtent &&
          _buildContext != null) {
        _buildContext!
            .read<WorkshopCardSetViewModel>()
            .getMoreCardSets(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _loadCardSetsButton(void Function()? onPressed) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: onPressed,
    );
  }
}
