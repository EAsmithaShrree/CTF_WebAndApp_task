import 'package:CTF_task/service_locator.dart';
import 'package:CTF_task/widgets/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './dishes_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  final String number = '7338850301';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 10),
        child: Row(
          children: [
            SizedBox(
              width: deviceSize.width / 1.8,
              child: RaisedButton(
                //highlightedBorderColor: Colors.black,
                color: Colors.red[200].withOpacity(0.5),

                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(DishesMenu.routeName),
                child: Text(
                  'MENU',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            SizedBox(width: 11),
            SizedBox(
              width: deviceSize.width / 3,
              child: RaisedButton(
                //highlightedBorderColor: Colors.black,
                color: Colors.red[200].withOpacity(0.5),
                onPressed: () => _service.call(number),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone),
                    Text(
                      'CALL',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height / 2,
              child: Stack(
                children: [
                  Container(
                    height: deviceSize.height * 0.45,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.dstATop),
                        //image: AssetImage('assets/images/spices_home_page.jpg'),
                        image: AssetImage(
                            'assets/images/south-indian-breakfast-home-page.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 59, top: 165, right: 5),
                          child: Text(
                            "HOTEL MURUGA BHAVAN",
                            style: TextStyle(
                              fontSize: 37,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.5, right: 10),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Muruga Bhavan Hotel’s roots can be traced all the way back to 1957. Founded by Mr. Nagasamy Naidu, the restaurant is known for it's authentic dishes. The unswerving nature and mouthwatering taste of all the dishes can be attributed to the fact that all the ingredients were prepared by Naidu, himself. Despite its roots going back 50 years, his cookery style and secrets passed down to his family members and are being followed meticulously and thereby have ensured that the taste remains unchanged.",
                  style: GoogleFonts.ubuntu(
                    height: 1.9,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            //SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _service {}
