import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/pedidos_table.dart';
import 'tables/items_pedido_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Pedidos, ItemsPedido])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'pedidos.sqlite');
    return NativeDatabase(File(dbPath));
  });
}
