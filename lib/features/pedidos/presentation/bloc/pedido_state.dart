import 'package:equatable/equatable.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

abstract class PedidoState extends Equatable {
  const PedidoState();

  @override
  List<Object?> get props => [];
}

class PedidoInitial extends PedidoState {}

class PedidoLoading extends PedidoState {}

class PedidoLoaded extends PedidoState {
  final List<PedidoEntity> pedidos;

  const PedidoLoaded(this.pedidos);

  @override
  List<Object?> get props => [];
}

class PedidoError extends PedidoState {
  final String mensaje;

  const PedidoError(this.mensaje);

  @override
  List<Object?> get props => [];
}
