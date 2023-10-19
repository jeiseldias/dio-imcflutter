import 'package:imc/model/usuario_model.dart';
import 'package:imc/repositories/sqlite_database.dart';

class UsuarioRepository {
  static Future<void> alterarDados(UsuarioModel usuarioModel) async {
    var db = await SQLiteDatabase().obterDB();

    db.rawUpdate("UPDATE dados SET nome = ?, altura = ?",
        [usuarioModel.nome, usuarioModel.altura]);
  }

  static Future<UsuarioModel> obterDados() async {
    var db = await SQLiteDatabase().obterDB();
    var result = await db.rawQuery("SELECT * FROM dados LIMIT 1");

    UsuarioModel dados = UsuarioModel(result[0]["nome"].toString(),
        int.parse(result[0]["altura"].toString()));

    return dados;
  }
}
