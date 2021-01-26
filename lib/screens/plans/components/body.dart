import 'package:flutter/material.dart';
import 'package:splash_and_dash_apk/constants.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<PlansInfo> plansInfoList = [
    PlansInfo(
      type: "Silver",
      price: "999",
      noWash: "15",
      noVacuum: "1",
      noInterior: "1",
    ),
    PlansInfo(
      type: "Gold",
      price: "1299",
      noWash: "20",
      noVacuum: "4",
      noInterior: "1",
    ),
    PlansInfo(
      type: "Platinum",
      price: "1599",
      noWash: "25",
      noVacuum: "4",
      noInterior: "4",
    ),
  ];

  PageController _pageController = PageController(
    viewportFraction: 0.7,
  );

  TextStyle detailsTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(40),
          ),
          child: Column(
            children: [
              AnimatedContainer(
                duration: kAnimationDuration,
                child: Row(
                  children: List.generate(plansInfoList.length, (index) {
                    return Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Container(
                          height: getProportionateScreenHeight(50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : Colors.transparent,
                            // border: Border.all(width: 0.5, color: Colors.grey),
                          ),
                          child: Text(
                            "${plansInfoList[index].type}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: currentPage == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Spacer(),
              SizedBox(
                height: getProportionateScreenHeight(500),
                width: SizeConfig.screenWidth,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: List.generate(plansInfoList.length, (index) {
                    return _buildPlansContainer(
                      plansInfoList[index].type,
                      plansInfoList[index].price,
                      plansInfoList[index].noWash,
                      plansInfoList[index].noVacuum,
                      plansInfoList[index].noInterior,
                    );
                  }),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  plansInfoList.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPlansContainer(String type, String price, String noWash,
      String noVacuum, String noInterior,
      {Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Material(
        elevation: 8,
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text("$type Plan"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("RS"),
                        Text(
                          "$price",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: darkBlueColor,
                          ),
                        ),
                      ],
                    ),
                    Text("A MONTH"),
                  ],
                ),
              ),
              Spacer(),
              Divider(
                color: Colors.grey,
                indent: 35,
                endIndent: 35,
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Text("$noWash Shampoo Wash", style: detailsTextStyle),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text("$noVacuum Vacuum Cleaning", style: detailsTextStyle),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text("$noInterior Interior Polish",
                        style: detailsTextStyle),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: getProportionateScreenHeight(50),
                child: FlatButton(
                  child: Text(
                    "Choose this plan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textColor: Colors.white,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 8),
      height: 11,
      width: 11,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
            color: currentPage == index ? kPrimaryColor : Colors.grey),
      ),
    );
  }
}

class PlansInfo {
  final String type;
  final String price;
  final String noWash;
  final String noVacuum;
  final String noInterior;

  PlansInfo(
      {this.type, this.price, this.noWash, this.noVacuum, this.noInterior});
}
