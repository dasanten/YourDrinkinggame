import 'package:flutter/material.dart';
import '../../../HttpService/Dto/CardDto.dart';

class CustomWorkshopCardTile extends StatelessWidget {
  final CardDto card;
  final void Function(bool value)? onActiveChanged;

  const CustomWorkshopCardTile({
    Key? key,
    required this.card,
    this.onActiveChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(card.content),
      ),
    );
  }
}
