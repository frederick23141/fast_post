import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';

class PedidoEntity {
  final int id;
  final DateTime fecha;
  final List<ItemPedidoEntity> items;

  PedidoEntity({required this.id, required this.fecha, required this.items});
}
