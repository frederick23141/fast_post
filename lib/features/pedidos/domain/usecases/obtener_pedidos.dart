import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidos {
  final PedidoRepository repository;

  ObtenerPedidos(this.repository);

  Future<List<PedidoEntity>> call() {
    return repository.obtenerPedidos();
  }
}
