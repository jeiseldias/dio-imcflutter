import 'package:imc/model/imc_model.dart';
import 'package:imc/repositories/sqlite_database.dart';

class IMCRepository {
  Future<List<ImcModel>> obterLeituras() async {
    var db = await SQLiteDatabase().obterDB();
    List<ImcModel> leituras = [];

    var result = await db.rawQuery("SELECT * FROM leituras ORDER BY id DESC");
    for (var leitura in result) {
      leituras.add(ImcModel(int.parse(leitura["altura"].toString()),
          int.parse(leitura["peso"].toString())));
    }

    return leituras;
  }

  Future<ImcModel> obterUltimaLeitura() async {
    var db = await SQLiteDatabase().obterDB();

    var result =
        await db.rawQuery("SELECT * FROM leituras ORDER BY id DESC LIMIT 1");

    ImcModel imcModel = ImcModel(int.parse(result[0]["altura"].toString()),
        int.parse(result[0]["peso"].toString()));

    return imcModel;
  }

  Future<void> salvarLeitura(ImcModel imcModel) async {
    var db = await SQLiteDatabase().obterDB();

    db.rawInsert("INSERT INTO leituras(altura, peso) VALUES (?,?)",
        [imcModel.altura, imcModel.peso]);
  }

  Future<void> excluirLeitura(ImcModel imcModel) async {
    var db = await SQLiteDatabase().obterDB();

    db.rawDelete("DELETE FROM leituras WHERE id = ?", [imcModel.id]);
  }
}
