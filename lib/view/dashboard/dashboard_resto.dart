import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ondriver/Asset/asset.dart';
import 'package:ondriver/controller/bloc/order_resto/order_resto_cubit.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/extension/conver_curreny.dart';
import 'package:ondriver/schema/delivery_status.dart';

class DashboardRestoScreen extends StatelessWidget {
  const DashboardRestoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final isarService = IsarService();
        return OrderRestoCubit(isarService)..getAllDataOrder();
      },
      child: const DashboardRestoContent(),
    );
  }
}

class DashboardRestoContent extends StatelessWidget {
  const DashboardRestoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orderan Masuk')),
      body: BlocBuilder<OrderRestoCubit, OrderRestoState>(
        builder: (context, state) {
          if (state is OrderRestoLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderRestoError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          if (state is OrderRestoSucces) {
            final orders = state.orderStatus;

            if (orders.isEmpty) {
              return const Center(child: Text("Belum ada pesanan."));
            }

            return ListView.builder(
              itemCount: orders.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(order.title),
                          subtitle: Text("Jumlah: ${order.quantity}"),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ConverCurreny().convertCurreny().format(
                                  order.price,
                                ),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order.statusOrder ? '✅ Diproses' : '⏳ Menunggu',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: order.statusOrder
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (order.statusOrder) ...[
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              final isarService = IsarService();
                              final cubit = context.read<OrderRestoCubit>();
                              final deliverOrder = DeliveryStatus()
                                ..id = order.id
                                ..image = Asset.imageBurger
                                ..price = order.price
                                ..quantity = order.quantity
                                ..statusDeliv = true
                                ..title = order.title
                                ..userLat = order.userLat
                                ..userLong = order.userLong;

                              await isarService.sendDataDriver(deliverOrder);
                              await isarService.deleterDataOrderByid(order.id);

                              await cubit.getAllDataOrder();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Terima Pesanan'),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
