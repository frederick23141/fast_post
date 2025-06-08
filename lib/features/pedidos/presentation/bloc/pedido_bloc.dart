import 'package:bloc/bloc.dart';
import 'package:fast_post/features/pedidos/data/datasources/pedido_local_datasource.dart';
import 'package:fast_post/features/pedidos/domain/usecases/agregar_pedido.dart';
import 'package:fast_post/features/pedidos/domain/usecases/obtener_pedidos.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_event.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  final AgregarPedido agregarPedido;
  final ObtenerPedidos obtenerPedidos;

  PedidoBloc({
    required this.obtenerPedidos,
    required this.agregarPedido,
    required PedidoLocalDatasource localDatasource,
  }) : super(PedidoInitial()) {
    on<CargarPedidos>((event, emit) async {
      emit(PedidoLoading());
      try {
        final pedidos = await obtenerPedidos();
        emit(PedidoLoaded(pedidos));
      } catch (e, st) {
        print('Error al cargar pedidos: $e\n$st');
        emit(PedidoError('Error al cargar pedidos'));
      }
    });

    on<AgregarNuevoPedido>((event, emit) async {
      try {
        await agregarPedido(event.pedido);

        await agregarPedido.debugImprimirPedidos();

        final pedidos = await obtenerPedidos();
        emit(PedidoLoaded(pedidos));
      } catch (e) {
        emit(PedidoError('Error al agregar pedido'));
      }
    });
  }
}
