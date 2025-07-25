import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/data/datasources/profile_local_data_source.dart';
import 'package:training_project/data/datasources/profile_remote_data_source.dart';
import 'package:training_project/data/repositories/profile_repository_impl.dart';
import 'package:training_project/domain/usecases/delete_account.dart';
import 'package:training_project/domain/usecases/get_profile.dart';
import 'package:training_project/presentation/blocs/profile/profile_cubit.dart';
import 'package:training_project/presentation/blocs/profile/profile_state.dart';
import 'package:training_project/presentation/routers/app_routes.dart';
import 'package:training_project/utils/globalFormat.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  void logoutButtonHandler(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  Widget buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => ProfileCubit(
            GetProfile(
              ProfileRepositoryImpl(
                remoteDataSource: ProfileRemoteDataSource(Dio()),
                localDataSource: ProfileLocalDataSource(),
              ),
            ),
            DeleteAccount(
              ProfileRepositoryImpl(
                remoteDataSource: ProfileRemoteDataSource(Dio()),
                localDataSource: ProfileLocalDataSource(),
              ),
            ),
          )..fetchProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile Info
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            "lib/assets/images/profile.png",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    state.name ?? "Tên người dùng",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.edit_outlined,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.email ?? "Email",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),

                    // Menu Items
                    buildListTile(Icons.shopping_bag_outlined, "Orders"),
                    const Divider(),
                    buildListTile(Icons.person_outline, "My Details"),
                    const Divider(),
                    buildListTile(
                      Icons.location_on_outlined,
                      "Delivery Address",
                    ),
                    const Divider(),
                    buildListTile(Icons.payment, "Payment Methods"),
                    const Divider(),
                    buildListTile(Icons.card_giftcard_outlined, "Promo Cord"),
                    const Divider(),
                    buildListTile(Icons.notifications_none, "Notifications"),
                    const Divider(),
                    buildListTile(Icons.help_outline, "Help"),
                    const Divider(),
                    buildListTile(Icons.info_outline, "About"),

                    const Spacer(),

                    // Delete Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed:
                            state.isLoading
                                ? null
                                : () {
                                  context.read<ProfileCubit>().deleteAccount();
                                },
                        child:
                            state.isLoading
                                ? const CircularProgressIndicator()
                                : const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Log Out
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F3F2),
                        border: Border.all(color: Color(0xFFF2F3F2)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextButton.icon(
                        onPressed: () => logoutButtonHandler(context),
                        label: Text(
                          "Log Out",
                          style: TextStyle(color: primaryColor),
                        ),
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
