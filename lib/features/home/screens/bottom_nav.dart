import 'package:flutter/material.dart';
import 'package:villagezone/features/home/screens/account.dart';
import 'package:villagezone/features/home/screens/dashboard.dart';
import 'package:villagezone/features/home/screens/favorites.dart';
import 'package:villagezone/features/home/screens/orders.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int mycurrentIndex=0;
  List pages=const[
    DashBoard(),
    FavoritesPage(),
    OrdersPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8, 20)
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.black,
              currentIndex: mycurrentIndex,
              onTap: (index){
                setState(() {
                  mycurrentIndex=index;
                });
              },
              items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.shop_2),label: "Orders"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
            ],),
          ),
        ),
        body: pages[mycurrentIndex],
      ),
    );
  }
}
