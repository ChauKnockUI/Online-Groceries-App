import 'package:flutter/material.dart';
import 'package:training_project/presentation/pages/accountPage.dart';
import 'package:training_project/presentation/pages/cartPage.dart';
import 'package:training_project/presentation/pages/explorePage.dart';
import 'package:training_project/presentation/pages/favouritePage.dart';
import 'package:training_project/presentation/pages/homePage.dart';
import 'package:training_project/utils/globalFormat.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    HomePage(),      
    ExplorePage(),
    CartPage(),
    FavouritePage(),
    AccountPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
          
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: roboto(400),
            unselectedLabelStyle: roboto(400),
            onTap: (index) {
              setState(() {
              currentIndex = index; 
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory_outlined, size: 35),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_search_rounded, size: 40),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 35),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined, size: 35),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded, size: 40),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
