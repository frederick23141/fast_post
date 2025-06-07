import 'package:drift/drift.dart';
import 'pedidos_table.dart'; // Import para usar Pedidos

class ItemsPedido extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pedidoId => integer().references(Pedidos, #id)();
  TextColumn get producto => text()();
  TextColumn get tamano => text()();
  TextColumn get salsas => text()();
  TextColumn get adiciones => text()();
}
