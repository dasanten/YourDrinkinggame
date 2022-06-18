import 'package:flutter/widgets.dart';
import '../data_base/card_set_db.dart';
import '../data_base/model/card_entity.dart';
import '../data_base/model/card_set_entity.dart';

import 'async_viewmodel_base.dart';

class CurrentCardSetViewmodel extends AsyncViewmodelBase {
  late List<CardEntity> _cards;
  CardSetEntity? _cardSet;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _adminTokenController;
  late TextEditingController _editorTokenController;

  CurrentCardSetViewmodel([this._cardSet]) {
    _cards = <CardEntity>[];
    _nameController = TextEditingController(
      text: _cardSet?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: _cardSet?.description ?? '',
    );
    _adminTokenController = TextEditingController(
      text: _cardSet?.adminToken ?? ''
    );
    _editorTokenController = TextEditingController(
      text: _cardSet?.editorToken ?? ''
    );
  }

  CardSetEntity? get cardSet => _cardSet;
  List<CardEntity> get cards => _cards ;
  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get adminTokenController => _adminTokenController;
  TextEditingController get editorTokenController => _editorTokenController;
  bool get isAdmin => (_cardSet?.adminToken?.isNotEmpty ?? false) || (_cardSet?.workshopId?.isEmpty ?? true);
  bool get isEditor => ((_cardSet?.editorToken?.isNotEmpty ?? false) && !isAdmin) || (_cardSet?.workshopId?.isEmpty ?? true);

  void setCardSet(CardSetEntity newCardSet) {
    _cardSet = newCardSet;
    _nameController.text = _cardSet!.name;
    _descriptionController.text = _cardSet!.description;
    _adminTokenController.text = _cardSet!.adminToken ?? '';
    _editorTokenController.text = _cardSet!.editorToken ?? '';
    notifyListeners();
    getCards();
  }

  void reset() {
    _cardSet = null;
    _cards = [];
    notifyListeners();
  }

  Future<void> getCards() async {
    if (_cardSet != null) {
      setLoading();
      _cards = await CardSetDB.cardSetDB.getCards(_cardSet!.id!);
      setFinished();
    }
  }

  Future<void> insertCard(CardEntity card) async {
    await CardSetDB.cardSetDB.insertCard(card);
    await getCards();
  }

  Future<void> insertCardFromContent(String content) async {
    final card = CardEntity(
      active: true,
      cardSetId: _cardSet!.id!,
      content: content,
    );
    await insertCard(card);
  }

  Future<void> updateCard(CardEntity card) async {
    await CardSetDB.cardSetDB.updateCard(card);
    await getCards();
  }

  Future<void> deleteCard(int id) async {
    await CardSetDB.cardSetDB.deleteCard(id);
    await getCards();
  }

  void save() {
    _cardSet = _cardSet!.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
      // TODO Gucken was jetzt gemacht werden muss
      // adminToken: _adminTokenController.text,
      // editorToken: _editorTokenController.text,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _adminTokenController.dispose();
    _editorTokenController.dispose();
    super.dispose();
  }
}
