//responsavel por guardar a informações do feedback para enviar no banco de dados
import 'package:cardapio_do_bentao/model/local_db/get_User_local_db.dart';

import '../../config/connection_db.dart';

class BdFeedback {
  var dataBase = new connectionDB();
  UserGetMemoria userDados = new UserGetMemoria();

  queryEnviarFeedback(nota) async {
    DateTime dataNow = DateTime.now();
    String data = "${dataNow.year}-${dataNow.month}-${dataNow.day}";

    // periodo vai de 1 ao 2
    // curso vai de 1 ao 8
    var dadosUruario = await userDados.pegarUserMemoria();
    int periodo = dadosUruario[0];
    int curso = dadosUruario[1];

    String sql =
        "INSERT INTO avaliacao(data,nota,periodo,curso) VALUE('${data}','${nota}',${periodo},${curso} ) ";

    dataBase.getConnection().then((conn) async {
      conn.query(sql);
    });
  }
}
