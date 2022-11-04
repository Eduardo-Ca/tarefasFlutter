import 'package:projeto1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablelevel('
      '$_level INTEGER)';

  static const String _tablelevel = 'levelTable';
  static const String _level = 'level';

}