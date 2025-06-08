import 'package:equatable/equatable.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

abstract class PedidoEvent extends Equatable {
  const PedidoEvent();

  @override
  List<Object?> get props => [];
}

class CargarPedidos extends PedidoEvent {}

class AgregarNuevoPedido extends PedidoEvent {
  final PedidoEntity pedido;

  const AgregarNuevoPedido(this.pedido);

  @override
  List<Object?> get props => [pedido];
}
