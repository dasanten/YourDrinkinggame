import 'dart:ffi';

import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/data_base/models/card_set_entity.dart';
import 'package:your_drinking_game_app/viewmodel/workshop_card_set_viewmodel.dart';

import '../../../component/tile/custom_workshop_card_set_tile.dart';


class WorkshopCardSetsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => WorkshopCardSetsViewState();
  
}

class WorkshopCardSetsViewState extends State<WorkshopCardSetsView> {

  final ScrollController _scrollController = ScrollController();
  // final bool _loading = false; 
  BuildContext? _buildContext;

  @override
  Widget build(BuildContext context) {
    this._buildContext = context;
    return Consumer<WorkshopCardSetViewmodel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (viewmodel.cardSetList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: viewmodel.getWorkshopCardSets,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: viewmodel.cardSetList.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) {
                if(i >= viewmodel.cardSetList.length) {
                  viewmodel.cardSetList.add(CardSetBasicDto());
                }
                return CustomWorkshopCardSetTile(
                  cardSet: viewmodel.cardSetList[i],
                  isLocal: viewmodel.getCardSetLocalById(
                    viewmodel.cardSetList[i].id!,
                  ),
                );
              } 
            ),
          );
        }
        return const Center(
          child: Text('Keine Sets gefunden.'),
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { 
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && _buildContext!=null) {
        _buildContext!.read<WorkshopCardSetViewmodel>().getMoreCardSets();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
