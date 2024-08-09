import 'package:flutter/widgets.dart';

class Tapped extends ChangeNotifier{
  bool _tapped = false;
  get tapped => _tapped;

  void isTapped(){
    _tapped = !_tapped;
    notifyListeners();
  }

}

class SelectedUser with ChangeNotifier {
  int? _selectedUserId;

  int? get selectedUserId => _selectedUserId;

  void selectUser(int userId) {
    _selectedUserId = userId;
    notifyListeners();
  }
  void resetUser() {
    _selectedUserId = null;
    notifyListeners();
  }
}