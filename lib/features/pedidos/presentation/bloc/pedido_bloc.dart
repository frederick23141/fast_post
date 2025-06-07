import 'package:bloc/bloc.dart';
import 'package:fast_post/features/pedidos/data/datasources/pedido_local_datasource.dart';
import 'package:fast_post/features/pedidos/domain/usecases/agregar_pedido.dart';
import 'package:fast_post/features/pedidos/domain/usecases/obtener_pedidos.dart';
import 'pedido_event.dart';
import 'pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  final AgregarPedido agregarPedido;
  final ObtenerPedidos obtenerPedidos;
  final PedidoLocalDatasource localDatasource;

  PedidoBloc({
    required this.obtenerPedidos,
    required this.agregarPedido,
    required this.localDatasource,
  }) : super(PedidoInitial()) {
    on<CargarPedidos>((event, emit) async {
      emit(PedidoLoading());
      try {
        final pedidos = await obtenerPedidos();
        emit(PedidoLoaded(pedidos));
      } catch (e) {
        emit(PedidoError('Error al cargar pedidos'));
      }
    });

    on<AgregarNuevoPedido>((event, emit) async {
      try {
        await agregarPedido(event.pedido);

        // Aquí llamamos a debugImprimirPedidos para ver en consola qué hay en BD
        await agregarPedido.debugImprimirPedidos();

        final pedidos = await obtenerPedidos();
        emit(PedidoLoaded(pedidos));
      } catch (e) {
        emit(PedidoError('Error al agregar pedido'));
      }
    });
  }
}
