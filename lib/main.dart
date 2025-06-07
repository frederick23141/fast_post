import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/database/app_database.dart';
import 'features/pedidos/data/datasources/pedido_local_datasource.dart';
import 'features/pedidos/data/repositories/pedido_repository_impl.dart';
import 'features/pedidos/domain/usecases/agregar_pedido.dart';
import 'features/pedidos/domain/usecases/obtener_pedidos.dart';
import 'features/pedidos/presentation/bloc/pedido_bloc.dart';
import 'features/pedidos/presentation/screens/pedido_form_screen.dart';

void main() {
  final db = AppDatabase();
  final pedidoLocalDatasource = PedidoLocalDatasource(db);
  final pedidoRepository = PedidoRepositoryImpl(pedidoLocalDatasource);

  final agregarPedido = AgregarPedido(pedidoRepository);
  final obtenerPedidos = ObtenerPedidos(pedidoRepository);

  runApp(
    BlocProvider(
      create:
          (_) => PedidoBloc(
            agregarPedido: agregarPedido,
            obtenerPedidos: obtenerPedidos,
            localDatasource: pedidoLocalDatasource,
          ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fast Post', home: PedidoFormScreen());
  }
}
