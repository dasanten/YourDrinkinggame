import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HttpService/CardSetService.dart';
import '../../../HttpService/Dto/CardSetDto.dart';

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
            return Text(snapshot.data[0].name);
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