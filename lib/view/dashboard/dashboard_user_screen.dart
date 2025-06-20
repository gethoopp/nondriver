import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondriver/Asset/asset.dart';
import 'package:ondriver/components/routes.dart';
import 'package:ondriver/controller/bloc/chinese_food_cubit/chinesee_food_cubit_cubit.dart';
import 'package:ondriver/controller/bloc/locationRealUser/location_real_user_cubit.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/controller/repository/chinesse_food_repository/chinesee.dart';
import 'package:ondriver/controller/repository/locator_user/location_user.dart';
import 'package:ondriver/schema/chinesee_food_item.dart';
import 'package:ondriver/widget/button_search.dart';
import 'package:ondriver/widget/fading_dots.dart';

class DashboardUserScreen extends StatelessWidget {
  const DashboardUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChineseeFoodRepository chineseeFoodRepository = GetListFood();
    return RepositoryProvider.value(
      value: chineseeFoodRepository,
      child: BlocProvider(
        create: (context) =>
            ChineseeFoodCubitCubit(chineseeFoodRepository)
              ..getListChineseFood(),
        child: DashboardUser(),
      ),
    );
  }
}

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  final BaseLocationUser locationUser = LocationRealUser();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: RepositoryProvider.value(
          value: locationUser,
          child: BlocProvider(
            create: (context) =>
                LocationRealUserCubit(locationUser)..locationPermission(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(Asset.iconAsset, width: 15, height: 15),

                      const SizedBox(width: 5),

                      // Tampilkan status izin lokasi
                      BlocBuilder<LocationRealUserCubit, LocationRealUserState>(
                        builder: (context, state) {
                          if (state is LocationRealUserLoaded) {
                            return Row(
                              children: [
                                SvgPicture.asset(Asset.iconAssetLoc),
                                SizedBox(width: 5),
                                const Text('Memeriksa izin lokasi...'),
                              ],
                            );
                          } else if (state is LocationRealUserSucces) {
                            return RepositoryProvider.value(
                              value: locationUser,
                              child: BlocProvider(
                                create: (context) =>
                                    LocationRealUserCubit(locationUser)
                                      ..locationGetResult(),
                                child:
                                    BlocBuilder<
                                      LocationRealUserCubit,
                                      LocationRealUserState
                                    >(
                                      builder: (context, locationState) {
                                        if (locationState
                                            is LocationRealUserSucces) {
                                          return Row(
                                            children: [
                                              SvgPicture.asset(
                                                Asset.iconAssetLoc,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '${locationState.permissionHandler}',
                                              ),
                                            ],
                                          );
                                        }
                                        return Row(
                                          children: [
                                            SvgPicture.asset(
                                              Asset.iconAssetLoc,
                                            ),
                                            SizedBox(width: 5),
                                            const Text(
                                              'Mencari Lokasi Pengguna',
                                            ),
                                            const FadingDots(
                                              color: Colors.grey,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                              ),
                            );
                          } else if (state is LocationRealUserError) {
                            return Row(
                              children: [
                                SvgPicture.asset(Asset.iconAssetLoc),
                                SizedBox(width: 5),
                                const Text('Aktifkan Izin Lokasi...'),
                              ],
                            );
                          } else {
                            return const Text("Menunggu respon...");
                          }
                        },
                      ),
                      const SizedBox(width: 5),

                      CircleAvatar(radius: 15),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buttonSearch(),
                SizedBox(height: 20),
                Stack(
                  children: [
                    // Latar belakang: Container dengan gradient
                    Container(
                      width: 320,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.redAccent,
                            Color(0xFFD15B5B),
                            Color(0xFFFFC1CC),
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    // Gambar di pojok kanan bawah
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.only(
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          Asset.imageBurger,
                          scale: 3.5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // memastikan semua child rata kiri
                        children: [
                          Text(
                            'Special offer \nfor March',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 2.5),
                          Text(
                            'We are here with the best\nDesert intown',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 16.0,
                          //   ),
                          //   child: TabBar(
                          //     labelColor: Colors.redAccent,
                          //     unselectedLabelColor: Colors.grey,
                          //     indicatorColor: Colors.redAccent,
                          //     tabs: const [
                          //       Tab(text: 'Foods'),
                          //       Tab(text: 'Drinks'),
                          //       Tab(text: 'Snacks'),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // warna untuk tab yang belum dipilih
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: Color.fromARGB(
                        255,
                        159,
                        17,
                        7,
                      ), // latar untuk tab terpilih
                      borderRadius: BorderRadius.circular(10),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Image.asset(Asset.icBurger),
                            SizedBox(width: 5),
                            Text('Foods', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Image.asset(Asset.icHotdog),
                            SizedBox(width: 5),
                            Text('Drinks', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Image.asset(Asset.icHotdog),
                            SizedBox(width: 5),
                            Text('Snacks', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                //content view
                SizedBox(
                  height: 250.h,
                  child: TabBarView(
                    children: [
                      // Tab 1: Foods
                      BlocBuilder<
                        ChineseeFoodCubitCubit,
                        ChineseeFoodCubitState
                      >(
                        builder: (context, state) {
                          if (state is ChineseeFoodCubitSuccesState) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: state.chineseListfood.length,
                              itemBuilder: (context, index) {
                                final food = state.chineseListfood[index];
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.detailCart,
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Container(
                                      width: 160,

                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Rating
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "4.5", // contoh: 4.5
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),

                                          // Gambar
                                          Center(
                                            child: Image.asset(
                                              Asset.imageBurger,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(height: 8),

                                          // Nama makanan
                                          Text(
                                            food.name!, // contoh: 'Chicken burger'
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 4),

                                          // Deskripsi
                                          Text(
                                            food.description!,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey[600],
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 20),

                                          // Harga dan tombol
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12.000',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final isarService =
                                                      IsarService();
                                                  final locationService =
                                                      LocationRealUser();
                                                  final pos = await locationService
                                                      .getLocationUserPosition();
                                                  final items =
                                                      ChineseeFoodItem()
                                                        ..id = food.id!
                                                        ..price = 12.000
                                                        ..quantity = 1
                                                        ..title = food.name!
                                                        ..userLat = pos.latitude
                                                        ..userLong =
                                                            pos.longitude;

                                                  await isarService
                                                      .sendDataOrder(items);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.pinkAccent,
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          if (state is ChineseeFoodErrorState) {
                            return Center(
                              child: Text('Tidak Dapat Mengambil Data'),
                            );
                          }

                          return SizedBox.shrink();
                        },
                      ),

                      // Tab 2: Drinks
                      ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.local_drink),
                              title: Text('Drink Item ${index + 1}'),
                              subtitle: Text('Cool and refreshing'),
                              trailing: Icon(Icons.arrow_forward_ios, size: 14),
                            ),
                          );
                        },
                      ),

                      // Tab 3: Snacks
                      ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.cookie),
                              title: Text('Snack Item ${index + 1}'),
                              subtitle: Text('Tasty and crispy'),
                              trailing: Icon(Icons.arrow_forward_ios, size: 14),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
