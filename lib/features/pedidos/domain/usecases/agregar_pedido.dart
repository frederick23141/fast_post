import 'package:fast_post/features/pedidos/data/repositories/pedido_repository_impl.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/repositories/pedido_repository.dart';

class AgregarPedido {
  final PedidoRepository repository;

  AgregarPedido(this.repository);

  Future<int> call(PedidoEntity pedido) async {
    return await repository.agregarPedido(pedido);
  }

  Future<void> debugImprimirPedidos() async {
    if (repository is PedidoRepositoryImpl) {
      await (repository as PedidoRepositoryImpl).debugImprimirPedidos();
    }
  }
}
