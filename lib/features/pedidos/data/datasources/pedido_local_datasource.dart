import 'dart:developer';

import 'package:drift/drift.dart' as drift;
import 'package:fast_post/core/database/app_database.dart';
import 'package:fast_post/features/pedidos/data/models/pedido_con_items.dart';

class PedidoLocalDatasource {
  final AppDatabase db;

  PedidoLocalDatasource(this.db);

  Future<void> insertarPedidoConItems(
    PedidosCompanion pedido,
    List<ItemsPedidoCompanion> items,
  ) async {
    await db.transaction(() async {
      final pedidoId = await db.into(db.pedidos).insert(pedido);
      final itemsConId =
          items
              .map((item) => item.copyWith(pedidoId: drift.Value(pedidoId)))
              .toList();

      await db.batch((batch) {
        batch.insertAll(db.itemsPedido, itemsConId);
      });

      log(
        'Pedido con ítems insertado en transacción. ID: $pedidoId, Ítems: ${items.length}',
      );
    });
  }

  Future<void> prueba() async {
    final pedidosSimples = await db.select(db.pedidos).get();
    print('Pedidos en tabla pedidos: ${pedidosSimples.length}');
  }

  Future<List<PedidoConItems>> obtenerPedidosConItems() async {
    final pedidosList = await db.select(db.pedidos).get();

    // Por cada pedido, obtenemos sus ítems
    List<PedidoConItems> resultado = [];

    for (final pedido in pedidosList) {
      final itemsList =
          await (db.select(db.itemsPedido)
            ..where((tbl) => tbl.pedidoId.equals(pedido.id))).get();

      resultado.add(PedidoConItems(pedido, itemsList));
    }

    return resultado;
  }
}
