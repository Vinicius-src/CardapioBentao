import 'package:cardapio_do_bentao/model/get_db/get_cardapioDia_db.dart';
import 'package:flutter/cupertino.dart';
import '../../config/connection_db.dart';

class ControllerCardapioDia extends ChangeNotifier {
  var dataBases = new connectionDB();
  BdUserDia cardapioDia = new BdUserDia();

  static String _cafe = "";
  static String _almoco = "";
  static String _lanche = "";
  static String _jantar = "";

  Future<String> get getCafe async =>
      await Future.delayed(Duration(seconds: 1), () {
        if (_cafe == "") {
          return "erro de conexão";
        } else {
          return _cafe;
        }
      });

  void setCafe(String cafe) => _cafe = cafe;

  Future<String> get getAlmoco async =>
      await Future.delayed(Duration(seconds: 1), () {
        if (_almoco == "") {
          return "erro de conexão";
        } else {
          return _almoco;
        }
      });
  void setAlmoco(String almoco) => _almoco = almoco;

  Future<String> get getLanche async =>
      await Future.delayed(Duration(seconds: 1), () {
        if (_lanche == "") {
          return "erro de conexão";
        } else {
          return _lanche;
        }
      });
  void setLanche(String lanche) => _lanche = lanche;

  Future<String> get getJantar async =>
      await Future.delayed(Duration(seconds: 1), () {
        if (_jantar == "") {
          return "erro de conexão";
        } else {
          return _jantar;
        }
      });
  void setJantar(String jantar) => _jantar = jantar;

  String verificaCardapionull(var testRefeicao) {
    if (testRefeicao == null) {
      return "Nenhuma informação";
    } else {
      return testRefeicao.toString();
    }
  }

  showManuDia() async {
    Map<String, dynamic> mapCardapio = await cardapioDia.queryCardapioDia();

    setCafe(verificaCardapionull(mapCardapio['cafe']));
    setAlmoco(verificaCardapionull(mapCardapio['almoco']));
    setLanche(verificaCardapionull(mapCardapio['lanche']));
    setJantar(verificaCardapionull(mapCardapio['jantar']));

    notifyListeners();
  }
}
