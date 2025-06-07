import 'package:fast_post/features/pedidos/presentation/bloc/pedido_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_bloc.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_state.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';

class PedidosListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Al entrar, disparamos evento para cargar pedidos
    context.read<PedidoBloc>().add(CargarPedidos());

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
                  title: Text('Pedido #${pedido.id}'),
                  subtitle: Text('Fecha: ${pedido.fecha.toLocal()}'),
                  onTap: () {
                    // Aquí puedes navegar a la pantalla de detalle si quieres
                  },
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
