import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget placeWidget(imagePath) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(
           builder: (context) => DetailScreen(imagePath)
         ));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightRedColor,
          ),
          child: Stack(
            children: <Widget>[
              /// For Hero Animation on route Transition
              Hero(
                tag: imagePath,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Turkey",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Chip(
                        backgroundColor: Colors.white,
                        label: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            SizedBox(width: 4,),
                            Text(
                              "4.7",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.veryLightTextColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// HEADER CONTAINER
            Container(
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
//                    color: Colors.redAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Merhaba, misafir kullanıcı!",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: AppColors.veryLightTextColor),
                        ),
                        Text(
                          "Tatil lokasyonunuzu seçin",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: AppColors.darkTextColor),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.asset('assets/images/me.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Listing options
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Top",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGreenColor,
                    ),
                  ),
                  Text(
                    "For you",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.veryLightTextColor,
                    ),
                  ),
                  Text(
                    "HIdden Gems",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.veryLightTextColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: AppColors.lightTextColor,
                    onPressed: () {},
                  )
                ],
              ),
            ),

            /// Spacing
            SizedBox(
              height: 16,
            ),

            /// GRID
            Expanded(
              child: Container(
                child: LayoutGrid(
                  columnGap: 12,
                  rowGap: 12,
                  templateColumnSizes: [
                    /// 50% both columns
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                  ],
                  templateRowSizes: [
                    /// three rows
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(0.6),
                    FlexibleTrackSize(1),
                  ],
                  children: <Widget>[
                    placeWidget("assets/images/2.svg").withGridPlacement(
                      rowStart: 0,
                      columnStart: 0,
                      rowSpan: 2,
                    ),
                    placeWidget("assets/images/3.svg").withGridPlacement(
                      rowStart: 2,
                      columnStart: 0,
                      rowSpan: 1,
                    ),
                    placeWidget("assets/images/4.svg").withGridPlacement(
                      rowStart: 0,
                      columnStart: 1,
                      rowSpan: 1,
                    ),
                    placeWidget("assets/images/5.svg").withGridPlacement(
                      rowStart: 1,
                      columnStart: 1,
                      rowSpan: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
