import 'package:fast_post/features/pedidos/data/datasources/pedido_local_datasource.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_event.dart';
import 'package:fast_post/features/pedidos/presentation/screens/pedido_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/presentation/bloc/pedido_bloc.dart';

class PedidoFormScreen extends StatefulWidget {
  const PedidoFormScreen({super.key});

  @override
  State<PedidoFormScreen> createState() => _PedidoFormScreenState();
}

class _PedidoFormScreenState extends State<PedidoFormScreen> {
  final List<ItemPedidoEntity> _items = [];

  void _agregarItem() {
    // Aquí puedes mostrar un dialog para agregar item con campos simples
    showDialog(
      context: context,
      builder: (_) {
        String producto = '';
        String tamano = '';
        String salsas = '';
        String adiciones = '';

        return AlertDialog(
          title: const Text('Agregar ítem'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Producto'),
                onChanged: (v) => producto = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Tamaño'),
                onChanged: (v) => tamano = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Salsas'),
                onChanged: (v) => salsas = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Adiciones'),
                onChanged: (v) => adiciones = v,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _items.add(
                    ItemPedidoEntity(
                      pedidoId: 0,
                      producto: producto,
                      tamano: tamano,
                      salsas: [salsas],
                      adiciones: [adiciones],
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _guardarPedido() async {
    if (_items.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No hay ítems para guardar')));
      return;
    }

    final pedido = PedidoEntity(
      fecha: DateTime.now(),
      items: List.from(_items), // clonar la lista actual
    );

    // Dispara evento para agregar el pedido al BLoC
    context.read<PedidoBloc>().add(AgregarNuevoPedido(pedido));

    // Limpiar la lista de ítems en el formulario
    setState(() {
      _items.clear();
    });

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Pedido guardado')));

    // Navegar a la pantalla que lista los pedidos
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PedidosListScreen()),
    );
  }

  /*
  void _guardarPedido() async {
    final localDatasource = RepositoryProvider.of<PedidoLocalDatasource>(
      context,
    );
    await localDatasource.insertarPedidoDePrueba();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pedido de prueba guardado')));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PedidosListScreen()),
    );
  }
*/
  void _listarPedidos() {
    // Navegar a la lista de pedidos después de guardar
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PedidosListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Pedido')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item.producto),
                  subtitle: Text(
                    '${item.tamano} | ${item.adiciones} | ${item.salsas}',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: _agregarItem,
                  child: const Text('Agregar ítem'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _items.isNotEmpty ? _guardarPedido : null,
                  child: const Text('Guardar pedido'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _listarPedidos(),
                  child: const Text('Listar pedido'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
