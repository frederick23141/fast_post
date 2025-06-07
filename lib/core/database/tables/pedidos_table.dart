import 'package:drift/drift.dart';

class Pedidos extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get fecha => dateTime()();
}
