import 'package:flutter/material.dart';

import '../../../HttpService/CardSetService.dart';
import '../../../HttpService/Dto/CardSetDto.dart';
import 'CustomWorkshopCardSetTile.dart';

class WorkshopCardSetsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkshopCardSetsView();

}

class _WorkshopCardSetsView extends State<WorkshopCardSetsView> {
  Future<List<CardSetDto>> futureCardSetDtoList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardSetDto>>(
        future: futureCardSetDtoList,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final List<CardSetDto> cardSetList = snapshot.data;
            return Scaffold(
                body: ListView.separated(
                  itemCount: cardSetList.length,
                  padding: const EdgeInsets.all(16.0),
                  separatorBuilder: (_, index) => const Divider(),
                  itemBuilder: (context, i) {
                    return CustomWorkshopCardSetTile(
                        cardSet: cardSetList[i]
                    );
                  },
                )
            );
          } else if(snapshot.hasError){
            return Text("$snapshot.error");
          }
          return const CircularProgressIndicator();
        },
      );
  }

  @override
  void initState() {
    super.initState();
    futureCardSetDtoList = CardSetService.getTopCardSets();
  }

}