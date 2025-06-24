import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:ondriver/Asset/asset.dart';
import 'package:ondriver/controller/bloc/iser_driver_order/cubit/isar_driver_order_cubit.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/controller/repository/route_service/route_services.dart';
import 'package:ondriver/extension/conver_curreny.dart';

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
  final LatLng driverStart = LatLng(-7.935582, 112.698463);
  final LatLng userPosition = LatLng(-7.953611, 112.614167);

  LatLng _currentPosition = LatLng(-7.935582, 112.698463);
  LatLng _previousPosition = LatLng(-7.935582, 112.698463);
  double _bearing = 0.0;

  bool _hasAnimated = false;
  List<LatLng> _routePoints = [];

  @override
  void initState() {
    super.initState();
    _loadRoute();
  }

  Future<void> _loadRoute() async {
    final points = await getRoutePoints(driverStart, userPosition);
    setState(() {
      _routePoints = points;
    });

    if (!_hasAnimated && points.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        animateAlongRoute(points);
      });
      _hasAnimated = true;
    }
  }

  void animateAlongRoute(List<LatLng> routePoints) async {
    for (int i = 0; i < routePoints.length - 1; i++) {
      final from = routePoints[i];
      final to = routePoints[i + 1];

      const segmentDuration = Duration(milliseconds: 300);
      const steps = 10;

      for (int step = 0; step <= steps; step++) {
        await Future.delayed(segmentDuration ~/ steps);
        setState(() {
          final lat = _lerpDouble(from.latitude, to.latitude, step / steps);
          final lng = _lerpDouble(from.longitude, to.longitude, step / steps);
          _previousPosition = _currentPosition;
          _currentPosition = LatLng(lat, lng);
          _bearing = _calculateBearing(_previousPosition, _currentPosition);
        });

        final distance = const Distance().as(
          LengthUnit.Meter,
          _currentPosition,
          userPosition,
        );
        if (distance < 20) {
          print("Pesanan anda telah sampai");
        }
      }
    }
  }

  double _lerpDouble(double a, double b, double t) => a + (b - a) * t;

  double _calculateBearing(LatLng from, LatLng to) {
    final lat1 = _toRadians(from.latitude);
    final lon1 = _toRadians(from.longitude);
    final lat2 = _toRadians(to.latitude);
    final lon2 = _toRadians(to.longitude);
    final deltaLon = lon2 - lon1;

    final y = math.sin(deltaLon) * math.cos(lat2);
    final x =
        math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(deltaLon);

    return math.atan2(y, x);
  }

  double _toRadians(double degree) => degree * math.pi / 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<IsarDriverOrderCubit, IsarDriverOrderState>(
          builder: (context, state) {
            if (state is IsarDriverOrderSucces) {
              final items = state.notifList;

              if (items.isEmpty) {
                return const Center(child: Text('Tidak ada orderan.'));
              }

              return Column(
                children: [
                  SizedBox(
                    height: 400.h,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: driverStart,
                        initialZoom: 14.5,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.application.ondriver',
                        ),
                        if (_routePoints.isNotEmpty)
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                points: _routePoints,
                                strokeWidth: 4,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: _currentPosition,
                              width: 60,
                              height: 60,
                              child: Transform.rotate(
                                angle: _bearing,
                                child: const Icon(
                                  Icons.delivery_dining,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Marker(
                              point: userPosition,
                              width: 60,
                              height: 60,
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
                                    Image.asset(Asset.imageBurger),
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
                                Text(
                                  'Harga:${ConverCurreny().convertCurreny().format(order.price)}',
                                ),
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
                          ),
                        );
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // for (var orderan in items) {
                  //       //   orderan.statusDeliv = false;
                  //       // }

                  //       // context.read<IsarDriverOrderCubit>().getActiveOrder();
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.green,
                  //       foregroundColor: Colors.white,
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 24,
                  //         vertical: 12,
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     child: Text('Pesanan Sampai'),
                  //   ),
                  // ),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
