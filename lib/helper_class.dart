import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const _DataBaseName = 'Hotel db.db';
  static const _databaseVersion = 28;
  static const HotelDetailsTable = 'HotelDetails_Table';

  static const columnID = '_id';
  static const columnQuantity = '_Quantity';
  static const columnAmount = '_Amount';
  static const columnProduct = '_Product';
  static const columnGst = '_Gst';

  late Database _db;

  Future<void> initialization() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _DataBaseName);

    _db = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''CREATE TABLE $HotelDetailsTable(
          $columnID INTEGER PRIMARY KEY,
          $columnQuantity TEXT,
          $columnAmount  TEXT,
          $columnProduct TEXT,
          $columnGst TEXT

  )''');
  }

  _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('drop table $HotelDetailsTable');
    _onCreate(database, newVersion);
  }

  Future<int> insert(Map<String, dynamic> row, String tableName) async {
    return await _db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }

  Future<int> update(Map<String, dynamic> row, String tableName) async {
    int id = row[columnID];
    return await _db.update(
      tableName,
      row,
      where: '$columnID = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$columnID = ?',
      whereArgs: [id],
    );
  }
}
