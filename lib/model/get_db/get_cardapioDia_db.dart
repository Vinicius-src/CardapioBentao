import 'package:cardapio_do_bentao/config/connection_db.dart';
import 'package:mysql1/mysql1.dart';

class BdUserDia {
  var dataBase = new connectionDB();

  Future<Map<String, dynamic>> queryCardapioDia() async {
    DateTime dataNow = DateTime.now();
    String data = "${dataNow.year}-${dataNow.month}-${dataNow.day}";

    String sql =
        "SELECT cafe, almoco, lanche, jantar FROM cardapio WHERE cardapio.data='${data}'";

    Map<String, dynamic> ResultadoCardapio = {};

    await dataBase.getConnection().then((conn) async {
      await conn.query(sql).then((results) {
        for (ResultRow getResults in results) {
          ResultadoCardapio = getResults.fields;
        }
      }).onError((error, stackTrace) {
        // print(error)
        return null;
      });

      conn.close();
    });

    return ResultadoCardapio;
  }
}
