import 'package:fast_post/features/pedidos/data/repositories/pedido_repository_impl.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/repositories/pedido_repository.dart';

class AgregarPedido {
  final PedidoRepository repository;

  AgregarPedido(this.repository);

  Future<void> call(PedidoEntity pedido) async {
    // Código para insertar el pedido
    await repository.agregarPedido(pedido);
  }

  Future<void> debugImprimirPedidos() async {
    if (repository is PedidoRepositoryImpl) {
      await (repository as PedidoRepositoryImpl).debugImprimirPedidos();
    }
  }
}
