//reponsavel por controlar o cardapio do dia, o que vai aparecer no banner principal
import 'package:flutter/cupertino.dart';

import '../../model/get_db/get_cardapioSemana_db.dart';

class ControllerCardapioSemana extends ChangeNotifier {
  static String _cafe = "";
  static String _almoco = "";
  static String _lanche = "";
  static String _jantar = "";

  String get getCafe {
    if (_cafe == "") {
      DateTime dataNow = DateTime.now();
      String data = "${dataNow.year}-${dataNow.month}-${dataNow.day}";
      showMenuSemana(data);

      return _cafe;
    } else {
      return _cafe;
    }
  }

  void setCafe(String cafe) => _cafe = cafe;

  String get getAlmoco {
    if (_almoco == "") {
      return "Erro de conexão";
    } else {
      return _almoco;
    }
  }

  void setAlmoco(String almoco) => _almoco = almoco;

  String get getLanche {
    if (_lanche == "") {
      return "Erro de conexão";
    } else {
      return _lanche;
    }
  }

  void setLanche(String lanche) => _lanche = lanche;

  String get getJantar {
    if (_jantar == "") {
      return "Erro de conexão";
    } else {
      return _jantar;
    }
  }

  void setJantar(String jantar) => _jantar = jantar;

  String testeCardapionull(var testRefeicao) {
    if (testRefeicao == null) {
      return "Nenhuma informação";
    } else {
      return testRefeicao.toString();
    }
  }

  showMenuSemana(data) async {
    Map<String, dynamic> mapCardapioSemana =
        await BdUserSemana().queryCardapioSemana(data);

    setCafe(testeCardapionull(mapCardapioSemana['cafe']));
    setAlmoco(testeCardapionull(mapCardapioSemana['almoco']));
    setLanche(testeCardapionull(mapCardapioSemana['lanche']));
    setJantar(testeCardapionull(mapCardapioSemana['jantar']));

    notifyListeners();
  }
}
