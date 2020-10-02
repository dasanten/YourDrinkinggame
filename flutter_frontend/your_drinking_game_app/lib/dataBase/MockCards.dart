import 'package:your_drinking_game_app/models/CardEntity.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

class MockCards {
  final List<String> cards = [
    "# und # trinken",
    "Alle Trinken",
    "Alle Männer trinken",
    "# muss exen",
    "# redet 3 Minuten lang nicht oder trinkt 4 schlücke",
    "# Singt ein Lied sonst 3 Schlücke",
    "Jeder trinkt einen Schluck für jeden Namen den er hat",
    "Alle mit schwarzen Socken trinken 3 Schlücke",
    "Jeder mit Blonden Haaren trinkt 2 Schlücke",
    "# trinkt",
    "# und # sind für die nächsten 3 Runden Trinkbuddies",
    "Die Person mit den teuersten Schuhen trinkt 3 Schlücke",
    "# darf eine Regel festlegen",
    "Alle die kleiner als 1.90m sind trinken 1 Schluck",
    "Alle Männer trinken 2 Schlücke",
    "Alle Frauen trinken 2 Schlücke",
    "Derjenige, der während des Spiels am wenigsten trinken musste, trinkt 5 Schlücke",
    "Jeder mit einem T-Shirt trinkt 3 Schlücke",
    "Alle die Haare länger als 8cm haben trinken 3 Schlücke",
    "# singe ein Lied, das der Rest der Gruppe auswählen darf oder trink 4 Schlücke",
    "#, # und # trinken 2 Schlücke",
    "# ext sein Glas ",
    "Wenn # noch kein Glas auf hat muss er es jetzt exen",
    "#, mach 5 Liegestütze und verteile 3 Schlücke oder trinke 3",
    "# ist jetzt der/die Daumenkönig/in, der/die Letzte trinkt 2 Schlücke",
    "Wenn # einfriert, müssen die anderen ihm/ihr nachmachen. Der/die letzte trinkt 2 Schlücke",
    "Kategorien! Wem nichts mehr einfällt, der trinkt 2 Schlücke. # fängt an.",
  ];

  static const CardSetEntity standardCardSet = CardSetEntity(
    name: "Standard Set",
    description: "Standard Karten set",
    active: true,
  );
  List<CardEntity> cardEntityList = <CardEntity>[];

  MockCards(int cardSetId) {
    cardEntityList = cards
        .map<CardEntity>(
          (element) => CardEntity(
            content: element,
            active: true,
            cardSetId: cardSetId,
          ),
        )
        .toList();
  }
}
