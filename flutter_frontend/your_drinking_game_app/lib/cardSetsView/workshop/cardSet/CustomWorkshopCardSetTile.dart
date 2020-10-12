import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../HttpService/Dto/CardSetDto.dart';

class CustomWorkshopCardSetTile extends StatelessWidget {
  final CardSetDto cardSet;

  const CustomWorkshopCardSetTile({
    Key key,
    @required this.cardSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(cardSet.name),
        subtitle: Text(cardSet.description),
      ),
    );
  }
}