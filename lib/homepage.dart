import 'dart:typed_data';
import 'package:db_animal_biography_app/views/screens/global.dart';
import 'package:db_animal_biography_app/widgets/appbar.dart';
import 'package:db_animal_biography_app/widgets/cir_pog_indi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'helper_class/api_animal.dart';
import 'helper_class/db_api_animal.dart';
import 'models/animal_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: height * 0.3,
              color: Global.color.withOpacity(0.8),
              child: Stack(
                children: [
                  FutureBuilder(
                    future: ImageAPIHelper.imageAPIHelper
                        .getImage(search: "elephant"),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        Uint8List? image = snapShot.data;
                        return Image.memory(
                          height: height * 0.38,
                          width: double.infinity,
                          image!,
                          fit: BoxFit.cover,
                          color: Global.color.withOpacity(0.8),
                          colorBlendMode: BlendMode.modulate,
                        );
                      } else if (snapShot.hasError) {
                        return Center(child: Text("${snapShot.error}"));
                      } else {
                        return circularProgressIndicator();
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        appBar(),
                        SizedBox(height: 20),
                        Text(
                          "Welcome to\nNew Aplanet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white.withOpacity(0.86),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        // SizedBox(height: height * 0.1),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.70,
                width: width,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Global.color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Related for you",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // FutureBuilder(
                    //   future: DBHelper.dbHelper.fetchAllAnimalData(
                    //       tableName: "animalsData", data: Global.animal),
                    //   builder: (context, snapShot) {
                    //     if (snapShot.hasData) {
                    //       List<AnimalDB> res = snapShot.data!;
                    //       return SizedBox(
                    //         height: height * 0.45,
                    //         child: ListView.builder(
                    //           physics: BouncingScrollPhysics(),
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: res.length,
                    //           itemBuilder: (context, i) {
                    //             return Padding(
                    //               padding: const EdgeInsets.only(
                    //                 top: 10,
                    //                 right: 15,
                    //               ),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //                   Container(
                    //                     height: height * 0.31,
                    //                     width: width * 0.5,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius:
                    //                       BorderRadius.circular(7),
                    //                       boxShadow: [
                    //                         BoxShadow(
                    //                           color:
                    //                           Colors.black.withOpacity(0.2),
                    //                           blurRadius: 3,
                    //                         )
                    //                       ],
                    //                       image: DecorationImage(
                    //                         fit: BoxFit.cover,
                    //                         image: MemoryImage(res[i].image),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   const SizedBox(height: 3),
                    //                   Text(
                    //                     res[i].name,
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 20,
                    //                       fontWeight: FontWeight.w600,
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     width: width * 0.5,
                    //                     child: Text(
                    //                       res[i].description,
                    //                       style: TextStyle(
                    //                         color:
                    //                         Colors.white.withOpacity(0.8),
                    //                         fontWeight: FontWeight.w500,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     } else if (snapShot.hasError) {
                    //       return Center(child: Text("${snapShot.error}"));
                    //     } else {
                    //       return circularProgressIndicator();
                    //     }
                    //   },
                    // ),
                    Text(
                      "Quick Categories",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}