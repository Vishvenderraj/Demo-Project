import 'package:flutter/widgets.dart';

class Tapped extends ChangeNotifier{
  bool _tapped = false;
  Tapped(this._tapped);
  get tapped => _tapped;

  void isTapped(){
    _tapped = !_tapped;
    notifyListeners();
  }

}
