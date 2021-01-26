import 'package:flutter/material.dart';
import 'package:splash_and_dash_apk/screens/plans/plans_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedVehicle = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 0,
          height: SizeConfig.screenHeight * 0.5,
          width: SizeConfig.screenWidth,
          child: Image.asset(
            "assets/images/car-wash-gif.gif",
          ),
        ),
        // Positioned(
        //   top: 20,
        //   child: Text(
        //     "WELCOME",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 30,
        //       fontWeight: FontWeight.w900,
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 0,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
            child: Container(
              height: SizeConfig.screenHeight * 0.63,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(60),
              ),
              padding: EdgeInsets.fromLTRB(30, 40, 30, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select one vehicle",
                    style: subHeadingStyle.copyWith(
                      color: darkBlueColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _selectVehicleRow(
                                1, "Bus / Truck", "assets/images/bus.png"),
                            _selectVehicleRow(
                                2, "4 Wheeler", "assets/images/supercar.png"),
                            // _selectVehicleRow(
                            //     3, "Jeep", "assets/images/jeep.png"),
                            _selectVehicleRow(
                                3, "2 Wheeler", "assets/images/bike.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(65),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.blue, width: 2),
                      ),
                      color: Colors.white,
                      highlightColor: Colors.blue.shade100,
                      onPressed: () {
                        if (selectedVehicle == 1) {
                          print("Bus / Truck");
                        } else if (selectedVehicle == 2) {
                          print("4 Wheeler");
                        } else if (selectedVehicle == 3) {
                          print("2 Wheeler");
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlansScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(19.5),
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectVehicleRow(int index, String title, String icon) {
    bool value = selectedVehicle == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedVehicle = index;
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: value ? Colors.blue : Colors.grey,
            ),
            alignment: Alignment.center,
            height: getProportionateScreenHeight(28),
            width: getProportionateScreenWidth(22),
            child: Icon(
              Icons.done,
              size: 19,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: value ? darkBlueColor : Colors.grey,
              ),
            ),
          ),
          Spacer(),
          ImageIcon(
            AssetImage("$icon"),
            size: 90,
            color: value ? Colors.blue : Colors.black,
          ),
        ],
      ),
    );
  }
}
