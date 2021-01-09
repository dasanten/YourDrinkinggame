import 'package:flutter/foundation.dart';

class AsyncViewmodelBase extends ChangeNotifier {
  AsyncViewmodelBase([this._isLoading = false]);

  bool _isLoading;

  bool get isLoading => _isLoading ?? false;

  void setLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void setFinished() {
    _isLoading = false;
    notifyListeners();
  }
}
