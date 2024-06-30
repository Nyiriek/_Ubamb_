import 'package:flutter/material.dart';
import 'package:ubamb/screens/location_destination.dart';
import 'home_screen.dart';
import 'account_screen.dart';

class PickupLocationScreen extends StatelessWidget {
  const PickupLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CA6F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 34),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              Image.asset(
                'assets/images/img_5.png',
                width: 620,
                height: 300,
              ),
             const Padding(padding:  EdgeInsets.only(left: 90),
               child: Text(
                   'Choose your pick-up location',
                 style:  TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                 ),
               ),
             ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Text('Zimmerman Roysambu',
                    style: TextStyle(
                      color:  Color(0xFF1A1E1E),
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LocationDestinationScreen()),
                    );
                    },
                    child: Container(
                      width: 130,
                      height: 70,
                      decoration: BoxDecoration(
                        color:  Color(0xFF0284FB),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1E1E),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              Row(
                children: [
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LocationDestinationScreen()),
                    );
                    },
                    child: Container(
                      width: 350,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(
                        child: Text(
                          'Confirm pick-up',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon:  Icon(Icons.home, size: 31, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      const Text('Home'),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(Icons.history, size: 31),
                      const SizedBox(height: 7),
                      Text('History'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon:  const Icon(Icons.account_circle, size: 31, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AccountScreen()),
                          );
                        },
                      ),
                      Text('Account'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context,
      {required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.black),
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
