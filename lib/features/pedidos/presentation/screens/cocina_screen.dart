import 'package:flutter/material.dart';
import 'package:fast_post/features/pedidos/domain/entities/pedido_entity.dart';
import 'package:fast_post/features/pedidos/domain/entities/item_pedido_entity.dart';

// ⚠️ Esto deberás reemplazar por un provider o BLoC real luego.
Future<List<PedidoEntity>> obtenerPedidosMock() async {
  await Future.delayed(const Duration(seconds: 1)); // Simula carga
  return [
    PedidoEntity(
      id: 1,
      fecha: DateTime.now(),
      items: [
        ItemPedidoEntity(
          id: 1,
          pedidoId: 1,
          producto: 'Hamburguesa',
          tamano: 'Grande',
          salsas: ['mayo, bbq'],
          adiciones: ['Queso, Tocineta'],
        ),
        ItemPedidoEntity(
          id: 2,
          pedidoId: 1,
          producto: 'Perro',
          tamano: 'Pequeño',
          salsas: ['Rosada'],
          adiciones: ['Carne'],
        ),
      ],
    ),
  ];
}

class CocinaScreen extends StatefulWidget {
  const CocinaScreen({super.key});

  @override
  State<CocinaScreen> createState() => _CocinaScreenState();
}

class _CocinaScreenState extends State<CocinaScreen> {
  late Future<List<PedidoEntity>> _futurePedidos;

  @override
  void initState() {
    super.initState();
    _futurePedidos = obtenerPedidosMock(); // luego se usa BLoC
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos en Cocina')),
      body: FutureBuilder<List<PedidoEntity>>(
        future: _futurePedidos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay pedidos.'));
          }

          final pedidos = snapshot.data!;

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              return Card(
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pedido número ${pedido.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...pedido.items.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '- ${item.producto} (${item.tamano})\n  Salsas: ${item.salsas} | Adiciones: ${item.adiciones}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
