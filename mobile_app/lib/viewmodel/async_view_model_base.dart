import 'package:flutter/foundation.dart';

class AsyncViewModelBase extends ChangeNotifier {
  AsyncViewModelBase([this._isLoading = false]);

  bool _isLoading;

  bool get isLoading => _isLoading;

  void setLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void setFinished() {
    _isLoading = false;
    notifyListeners();
  }
}
