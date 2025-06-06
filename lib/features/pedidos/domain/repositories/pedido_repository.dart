import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

abstract class PedidoRepository {
  Future<void> agregarPedido(PedidoEntity pedido);
  Future<List<PedidoEntity>> obtenerPedidos();
}
