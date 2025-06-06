import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/repositories/pedido_repository.dart';

class AgregarPedido {
  final PedidoRepository repository;

  AgregarPedido(this.repository);

  Future<void> call(PedidoEntity pedido) {
    return repository.agregarPedido(pedido);
  }
}
