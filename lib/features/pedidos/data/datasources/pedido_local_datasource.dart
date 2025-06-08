import 'dart:developer';

import 'package:drift/drift.dart' as drift;
import 'package:fast_post/core/database/app_database.dart';
import 'package:fast_post/features/pedidos/data/models/pedido_con_items.dart';

class PedidoLocalDatasource {
  final AppDatabase db;

  PedidoLocalDatasource(this.db);

  Future<int> insertarPedidoConItems(
    PedidosCompanion pedido,
    List<ItemsPedidoCompanion> items,
  ) async {
    return await db.transaction(() async {
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

      return pedidoId; // <-- Retorna aquí el ID generado
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

  Future<void> insertarPedidoDePrueba() async {
    final pedidoCompanion = PedidosCompanion(
      fecha: drift.Value(DateTime.now()),
    );

    final pedidoId = await db.into(db.pedidos).insert(pedidoCompanion);

    final items = [
      ItemsPedidoCompanion(
        pedidoId: drift.Value(pedidoId),
        producto: drift.Value('Perro caliente'),
        tamano: drift.Value('Mediano'),
        salsas: drift.Value('Mostaza'),
        adiciones: drift.Value('Queso'),
      ),
      ItemsPedidoCompanion(
        pedidoId: drift.Value(pedidoId),
        producto: drift.Value('Hamburguesa'),
        tamano: drift.Value('Grande'),
        salsas: drift.Value('Ketchup'),
        adiciones: drift.Value('Tocineta'),
      ),
    ];

    await db.batch((batch) {
      batch.insertAll(db.itemsPedido, items);
    });

    print('Pedido de prueba insertado con id $pedidoId');
  }
}
