import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: AssetImage("lib/assets/images/profile.png"), 
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Afsar Hossen",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        SizedBox(height: 4),
                        Text("lmshuvo97@gmail.com",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Icon(Icons.edit, color: Colors.green),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),

              // Menu Items
              buildListTile(Icons.shopping_bag_outlined, "Orders"),
              buildListTile(Icons.person_outline, "My Details"),
              buildListTile(Icons.location_on_outlined, "Delivery Address"),
              buildListTile(Icons.payment, "Payment Methods"),
              buildListTile(Icons.card_giftcard_outlined, "Promo Cord"),
              buildListTile(Icons.notifications_none, "Notifications"),
              buildListTile(Icons.help_outline, "Help"),
              buildListTile(Icons.info_outline, "About"),

              const Spacer(),

              // Delete Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text("Delete", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // Log Out
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
