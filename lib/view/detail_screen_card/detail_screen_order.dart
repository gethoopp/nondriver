import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ondriver/Asset/asset.dart';
import 'package:ondriver/controller/bloc/isar_local_storage/cubit/order_data_cubit.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/schema/chinesee_food_item.dart';
import 'package:ondriver/schema/order_status.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final isarService = IsarService();
        return OrderDataCubit(isarService)..getDataOrder();
      },
      child: const DetailScreenOrder(),
    );
  }
}

class DetailScreenOrder extends StatefulWidget {
  const DetailScreenOrder({super.key});

  @override
  State<DetailScreenOrder> createState() => _DetailScreenOrderState();
}

class _DetailScreenOrderState extends State<DetailScreenOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pesanan')),
      body: BlocBuilder<OrderDataCubit, OrderDataState>(
        builder: (context, state) {
          if (state is OrderDataLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderDataError) {
            return Center(child: Text("Gagal memuat data: ${state.message}"));
          }

          if (state is OrderDataSucces) {
            final List<ChineseeFoodItem> orders = state.chineseFood;

            if (orders.isEmpty) {
              return const Center(child: Text("Belum ada pesanan"));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final item = orders[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  Asset.imageBurger,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.fastfood),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text("Jumlah: ${item.quantity}"),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Rp ${item.price.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<OrderDataCubit, OrderDataState>(
        builder: (context, state) {
          if (state is OrderDataSucces && state.chineseFood.isNotEmpty) {
            return PriceSummarySection(orders: state.chineseFood);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class PriceSummarySection extends StatelessWidget {
  final List<ChineseeFoodItem> orders;

  const PriceSummarySection({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final subTotal = orders.fold<double>(0, (sum, item) => sum + item.price);
    const deliveryCharge = 0.0;
    const discount = 0.0;
    final total = subTotal + deliveryCharge - discount;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE52D27), Color(0xFFFF6A00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        image: const DecorationImage(
          image: AssetImage(Asset.bgImagePrice),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _priceRow('Sub-Total', subTotal),
          _priceRow('Delivery Charge', deliveryCharge),
          _priceRow('Discount', discount),
          const Divider(color: Colors.white),
          _priceRow('Total', total, isBold: true),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final isarService = IsarService();
                final cubit = context.read<OrderDataCubit>();

                for (var item in orders) {
                  final orderData = OrderStatus()
                    ..id = item.id
                    ..price = item.price
                    ..quantity = item.quantity
                    ..statusOrder = true
                    ..title = item.title
                    ..userLat = item.userLat
                    ..userLong = item.userLong;

                  await isarService.sendActiveOrder(orderData);
                }
                await isarService.clearAllOrderSuccesData();
                await cubit.getDataOrder();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Place My Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
