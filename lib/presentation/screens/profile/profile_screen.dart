import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsphere/data/models/user_model.dart';
import 'package:shopsphere/logic/cubits/user_cubit/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEDFA),

      body: SafeArea(
        child: BlocBuilder<UserCubit, UserModel?>(
          builder: (context, user) {
            if (user == null) {
              context.read<UserCubit>().getUser();

              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF333740),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber, width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "50% Profile Complete",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        children: [
                          settingsRow(Icons.person, "Edit Profile"),
                          divider(),

                          settingsRow(Icons.lock, "Change Password"),
                          divider(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.dark_mode),
                                  SizedBox(width: 12),
                                  Text("Dark Mode"),
                                ],
                              ),

                              Switch(
                                value: true,
                                activeColor: Colors.green,
                                onChanged: (value) {},
                              ),
                            ],
                          ),

                          divider(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.color_lens),
                                  SizedBox(width: 12),
                                  Text("Theme"),
                                ],
                              ),

                              Switch(value: false, onChanged: (value) {}),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        children: [
                          settingsRow(Icons.privacy_tip, "Privacy Policy"),
                          divider(),

                          settingsRow(Icons.logout, "Log Out"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget settingsRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(children: [Icon(icon), const SizedBox(width: 12), Text(text)]),

          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget divider() {
    return const Divider(height: 1);
  }
}
