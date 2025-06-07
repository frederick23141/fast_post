import 'package:drift/drift.dart';
import 'package:fast_post/core/database/app_database.dart';
import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

extension PedidoEntityMapper on PedidoEntity {
  PedidosCompanion toCompanion() {
    return PedidosCompanion(id: Value(id!), fecha: Value(fecha));
  }
}

extension ItemPedidoEntityMapper on ItemPedidoEntity {
  ItemsPedidoCompanion toCompanion() {
    return ItemsPedidoCompanion(
      id: Value(id!),
      pedidoId: Value(pedidoId),
      producto: Value(producto),
      tamano: Value(tamano),
      salsas: Value(salsas),
      adiciones: Value(adiciones),
    );
  }
}
