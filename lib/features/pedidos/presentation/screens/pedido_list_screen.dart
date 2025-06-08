import 'package:fast_post/features/pedidos/presentation/bloc/pedido_bloc.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_event.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_state.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PedidosListScreen extends StatefulWidget {
  @override
  _PedidosListScreenState createState() => _PedidosListScreenState();
}

class _PedidosListScreenState extends State<PedidosListScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar pedidos solo una vez al iniciar la pantalla
    context.read<PedidoBloc>().add(CargarPedidos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedidos Guardados')),
      body: BlocBuilder<PedidoBloc, PedidoState>(
        builder: (context, state) {
          if (state is PedidoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PedidoLoaded) {
            final List<PedidoEntity> pedidos = state.pedidos;

            if (pedidos.isEmpty) {
              return Center(child: Text('No hay pedidos guardados'));
            }

            return ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                return ListTile(
                  title: Text('Pedido #${pedido.id ?? index + 1}'),
                  subtitle: Text('Fecha: ${pedido.fecha.toLocal()}'),
                );
              },
            );
          } else if (state is PedidoError) {
            return Center(child: Text(state.mensaje));
          }

          return Container();
        },
      ),
    );
  }
}
