import 'package:CTF_task/screens/only_non_veg_screen.dart';
import 'package:CTF_task/screens/only_veg_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/dishes_menu.dart';
import '../screens/filters_page.dart';
import '../screens/home_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.pink[200].withOpacity(0.2),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Muruga Bhavan",
              style: GoogleFonts.lexendDeca(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              "Meals",
              style: GoogleFonts.lexendDeca(
                fontSize: 22,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(DishesMenu.routeName),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              "Favourites",
              style: GoogleFonts.lexendDeca(
                fontSize: 22,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FiltersPage.routeName),
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood_outlined,
              size: 26,
            ),
            title: Text(
              "Vegetarian",
              style: GoogleFonts.lexendDeca(
                fontSize: 22,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(OnlyVeg.routeName),
          ),
          ListTile(
            leading: Icon(
              Icons.food_bank,
              size: 26,
            ),
            title: Text(
              "Non Vegetarian",
              style: GoogleFonts.lexendDeca(
                fontSize: 22,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OnlyNonVeg.routeName),
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26,
            ),
            title: Text(
              "About",
              style: GoogleFonts.lexendDeca(
                fontSize: 24,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(HomePage.routeName),
          ),
        ],
      ),
    );
  }
}
