import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'app_database.g.dart';

class Pedidos extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get fecha => dateTime()();
}

class ItemsPedido extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pedidoId => integer().references(Pedidos, #id)();
  TextColumn get producto => text()();
  TextColumn get tamano => text()();
  TextColumn get salsas => text()();
  TextColumn get adiciones => text()();
}

@DriftDatabase(tables: [Pedidos, ItemsPedido])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbpath = p.join(dir.path, 'pedidos.sqllite');
    return NativeDatabase(File(dbpath));
  });
}
