import 'dart:developer';

import 'package:fast_post/features/pedidos/data/datasources/pedido_local_datasource.dart';
import 'package:fast_post/features/pedidos/data/models/pedido_con_items.dart';
import 'package:fast_post/features/pedidos/data/models/pedido_model.dart';
import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/repositories/pedido_repository.dart';

class PedidoRepositoryImpl implements PedidoRepository {
  final PedidoLocalDatasource localDatasource;

  PedidoRepositoryImpl(this.localDatasource);

  // Método debug para revisar datos en base
  Future<void> debugImprimirPedidos() {
    return localDatasource.prueba();
  }

  @override
  Future<void> agregarPedido(PedidoEntity pedido) async {
    final pedidoCompanion = pedido.toCompanion();
    final itemsCompanions = pedido.items.map((i) => i.toCompanion()).toList();

    await localDatasource.insertarPedidoConItems(
      pedidoCompanion,
      itemsCompanions,
    );
  }

  @override
  Future<List<PedidoEntity>> obtenerPedidos() async {
    final List<PedidoConItems> rows =
        await localDatasource.obtenerPedidosConItems();

    log('Pedidos obtenidos: ${rows.length}');

    return rows.map((row) {
      final pedido = row.pedido;
      final items =
          row.items.map((i) {
            return ItemPedidoEntity(
              id: i.id,
              pedidoId: i.pedidoId,
              producto: i.producto,
              tamano: i.tamano,
              salsas: i.salsas,
              adiciones: i.adiciones,
            );
          }).toList();

      return PedidoEntity(id: pedido.id, fecha: pedido.fecha, items: items);
    }).toList();
  }

  @override
  Future<void> insertarPedidoConItems(PedidoEntity pedido) {
    return agregarPedido(pedido);
    // O si quieres, directamente:
    // final pedidoCompanion = pedido.toCompanion();
    // final itemsCompanions = pedido.items.map((i) => i.toCompanion()).toList();
    // return localDatasource.insertarPedidoConItems(pedidoCompanion, itemsCompanions);
  }
}
