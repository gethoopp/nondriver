import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:ondriver/controller/bloc/iser_driver_order/cubit/isar_driver_order_cubit.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/controller/repository/route_service/route_services.dart';
import 'package:ondriver/schema/notification_order.dart';
import 'package:ondriver/schema/order_status.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final isarService = IsarService();
        return IsarDriverOrderCubit(isarService)..getActiveOrder();
      },
      child: const DriverDashboardScreen(),
    );
  }
}

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  final LatLng driverPosition = LatLng(-6.200000, 106.816666); // Posisi driver

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<IsarDriverOrderCubit, IsarDriverOrderState>(
          builder: (context, state) {
            if (state is IsarDriverOrderSucces) {
              final items = state.notifList;

              if (items.isEmpty) {
                return const Center(child: Text('Tidak ada orderan driver.'));
              }

              final firstOrder = items.first;
              final userPosition = LatLng(
                firstOrder.userLat,
                firstOrder.userLong,
              );

              return FutureBuilder<List<LatLng>>(
                future: getRoutePoints(driverPosition, userPosition),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Gagal memuat rute: ${snapshot.error}'),
                    );
                  }

                  final routePoints = snapshot.data ?? [];

                  return Column(
                    children: [
                      // Peta dengan polyline rute jalan
                      SizedBox(
                        height: 300.h,
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: driverPosition,
                            initialZoom: 14.5,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.application.ondriver',
                            ),
                            PolylineLayer(
                              polylines: [
                                Polyline(
                                  points: routePoints,
                                  strokeWidth: 4.0,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 60,
                                  height: 60,
                                  point: driverPosition,
                                  child: const Icon(
                                    Icons.delivery_dining,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ),
                                Marker(
                                  width: 60,
                                  height: 60,
                                  point: userPosition,
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Daftar Order
                      Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final order = items[index];

                            return Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    order.image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
                                ),
                                title: Text(
                                  order.title,
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Harga: Rp${order.price}'),
                                    Text('Jumlah: ${order.quantity}'),
                                  ],
                                ),
                                trailing: Icon(
                                  order.statusDeliv
                                      ? Icons.check_circle
                                      : Icons.pending_actions,
                                  color: order.statusDeliv
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                                onTap: () async {
                                  final isarService = IsarService();
                                  final cubit = context
                                      .read<IsarDriverOrderCubit>();

                                  final updatedOrder = OrderStatus()
                                    ..id = order.id
                                    ..title = order.title
                                    ..price = order.price
                                    ..quantity = order.quantity
                                    ..statusOrder = true;

                                  final notifOrder = NotifcaitonOrderStatus()
                                    ..id = order.id
                                    ..price = order.price
                                    ..statusOrder = true
                                    ..title = order.title
                                    ..quantity = order.quantity;

                                  // await isarService.sendActiveOrder(notifOrder);
                                  // await isarService.deleteOrderDataItem(
                                  //   updatedOrder,
                                  // );
                                  // await cubit.orderlData();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
