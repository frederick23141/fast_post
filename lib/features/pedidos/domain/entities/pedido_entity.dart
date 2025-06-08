import 'package:drift/drift.dart' as drift;
import 'package:fast_post/core/database/app_database.dart';
import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';

class PedidoEntity {
  final int? id;
  final DateTime fecha;
  final List<ItemPedidoEntity> items;

  PedidoEntity({this.id, required this.fecha, required this.items});

  PedidosCompanion toCompanion() {
    return PedidosCompanion(fecha: drift.Value(fecha));
  }
}
