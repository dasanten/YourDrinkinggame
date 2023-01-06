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
    return Consumer<WorkshopCardSetViewmodel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.isLoading && !viewmodel.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (viewmodel.cardSetList.isNotEmpty) {
          return RefreshIndicator(
              onRefresh: viewmodel.getWorkshopCardSets,
              child: Scaffold(
                floatingActionButton: FloatingActionButton.small(
                  onPressed: viewmodel.getWorkshopCardSets,
                  tooltip: "refresh",
                  child: Icon(Icons.refresh),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                body: ListView.separated(
                    controller: _scrollController,
                    itemCount: viewmodel.cardSetList.length +
                        (viewmodel.isLoadingMore ? 3 : 0),
                    separatorBuilder: (_, index) => const Divider(),
                    itemBuilder: (context, i) {
                      if (i >= viewmodel.cardSetList.length) {
                        return ListTile();
                      }
                      return CustomWorkshopCardSetTile(
                        cardSet: viewmodel.cardSetList[i],
                        isLocal: viewmodel.getCardSetLocalById(
                          viewmodel.cardSetList[i].id!,
                        ),
                      );
                    }),
              ));
        } else if (viewmodel.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Es konnte keien Verbindung zum Server hergestellt werden.'),
                _loadCardSetsButton(viewmodel.getWorkshopCardSets),
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Keine Sets gefunden.'),
              _loadCardSetsButton(viewmodel.getWorkshopCardSets),
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
            .read<WorkshopCardSetViewmodel>()
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
