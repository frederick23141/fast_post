import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

abstract class PedidoRepository {
  Future<void> insertarPedidoConItems(PedidoEntity pedido);
  Future<List<PedidoEntity>> obtenerPedidos();

  agregarPedido(PedidoEntity pedido) {}
}
