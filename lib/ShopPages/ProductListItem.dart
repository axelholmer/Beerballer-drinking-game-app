import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/CustomBackButton.dart';
import 'package:testflutter/CustomWidget/NoScrollbar.dart';
import 'package:testflutter/CustomWidget/customPopupDialog.dart';
import 'package:testflutter/CustomWidget/customProgressbar.dart';
import 'package:testflutter/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import '../GameClass.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;
import 'ProductClass.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductListItem extends StatefulWidget {
  ProductListItem(BuildContext context, {this.product});
  final ProductClass product;
  final CarouselController buttonCarouselController = CarouselController();

  @override
  State<StatefulWidget> createState() {
    return _ProductListItemState();
  }
}

//TODO disable horizontal scroll and make buttons splash bigger -> make container splash
class _ProductListItemState extends State<ProductListItem> {
  int _current = 0;



_launchUrl() async {
  final url = widget.product.url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 700,
      // width: SizeConfig.blockSizeHorizontal * 200, //Here Cardsize
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        color: Color.fromRGBO(50, 50, 50, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 22,
                child: FractionallySizedBox(
                    // widthFactor: 0.3,
                    //  heightFactor: 1,
                    child: Stack(
                  children: [
                    Container(
                        constraints: BoxConstraints.expand(),
                        child: NoScrollbar(
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: CarouselSlider(
                                carouselController:
                                    widget.buttonCarouselController,
                                options: CarouselOptions(
                                    viewportFraction: 1.0,
                                    height: 500,
                                    autoPlay: false,
                                    enableInfiniteScroll: false,
                                    scrollPhysics: new NeverScrollableScrollPhysics(),
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    }),
                                items: widget.product.productPicturesPaths
                                    .map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        // width: MediaQuery.of(context).size.width,
                                        child: Image.asset(i,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    30,
                                            fit: BoxFit.fill),
                                      );
                                    },
                                  );
                                }).toList(),
                              )
                              // Image.asset(product.productPicturesPaths[0],
                              //     // height: SizeConfig.blockSizeVertical * 30,
                              //     fit: BoxFit.fill),
                              ),
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        color: Colors.white.withOpacity(0.0),
                        child: InkWell(
                          onTap: () {
                             widget.buttonCarouselController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                          },
                          child: FractionallySizedBox(
                            widthFactor: 0.2,
                            child: Center(
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.2,
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child: Icon(
                                      // color: Color.fromRGBO(225, 225, 225, 1),
                                      Icons.arrow_back_ios,
                                      color: Color.fromRGBO(225, 225, 225, 1)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          color: Colors.white.withOpacity(0.0),
                          child: InkWell(
                              onTap: () {
                                widget.buttonCarouselController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: FractionallySizedBox(
                                widthFactor: 0.2,
                                child: Center(
                                  child: FractionallySizedBox(
                                    widthFactor: 0.8,
                                    heightFactor: 0.2,
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.contain,
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(math.pi),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Color.fromRGBO(
                                                225, 225, 225, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        )),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: FractionallySizedBox(
                    //     widthFactor: 0.2,
                    //     child: Center(
                    //       child: FractionallySizedBox(
                    //         widthFactor: 1,
                    //         heightFactor: 0.55,
                    //         child: FittedBox(
                    //           alignment: Alignment.centerLeft,
                    //           fit: BoxFit.contain,
                    //           child: IconButton(
                    //             splashColor: Colors.transparent,
                    //             highlightColor: Colors.transparent,
                    //             //padding: EdgeInsets.all(0),
                    //             color: Color.fromRGBO(225, 225, 225, 1),
                    //             //iconSize: SizeConfig.blockSizeVertical * 5,
                    //             icon: Icon(Icons.arrow_back_ios),
                    //             onPressed: () {
                    //               widget.buttonCarouselController.previousPage(
                    //                   duration: Duration(milliseconds: 300),
                    //                   curve: Curves.linear);
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: FractionallySizedBox(
                    //       widthFactor: 0.2,
                    //       child: Center(
                    //         child: FractionallySizedBox(
                    //           widthFactor: 1,
                    //           heightFactor: 0.55,
                    //           child: FittedBox(
                    //             alignment: Alignment.centerLeft,
                    //             fit: BoxFit.contain,
                    //             child: Transform(
                    //               alignment: Alignment.center,
                    //               transform: Matrix4.rotationY(math.pi),
                    //               child: IconButton(
                    //                 splashColor: Colors.transparent,
                    //                 highlightColor: Colors.transparent,
                    //                 //padding: EdgeInsets.all(0),
                    //                 color: Color.fromRGBO(225, 225, 225, 1),
                    //                 //iconSize: SizeConfig.blockSizeVertical * 5,
                    //                 icon: Icon(Icons.arrow_back_ios),
                    //                 onPressed: () {
                    //                   widget.buttonCarouselController.nextPage(
                    //                       duration: Duration(milliseconds: 300),
                    //                       curve: Curves.linear);
                    //                 },
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            widget.product.productPicturesPaths.map((url) {
                          int index =
                              widget.product.productPicturesPaths.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                )),
              ),

//               SizedBox(height: SizeConfig.blockSizeVertical * 20),

//ProductTitel
              Flexible(
                flex: 4,
                child: FractionallySizedBox(
                    //  widthFactor: 0.2,
                    //  heightFactor: 0.6,
                    child: Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(126, 126, 126, 1)),
                  child: FractionallySizedBox(
                      widthFactor: 0.93,
                      heightFactor: 1.9,
                      child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.contain,
                          child: AutoSizeText(
                            widget.product.productName,
                            textAlign: TextAlign.center,
                            // maxLines: 1,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w800,
                              //  height: SizeConfig.blockSizeHorizontal * 4.1
                            ),
                          ))),
                )),
              ),

              //Product description
              Flexible(
                  flex: 6,
                  // fit: FlexFit.loose,
                  child: FractionallySizedBox(
                    //  widthFactor: 0.2,
                    heightFactor: 1,
                    child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.6,
                        child: FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            child: Text(
                              widget.product.description,
                              textAlign: TextAlign.center,
                              // maxLines: 1,
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color.fromRGBO(238, 237, 237, 1),
                                fontWeight: FontWeight.w300,
                              ),
                            ))),
                  )),
// SizedBox(height: SizeConfig.blockSizeVertical * 50),
              Flexible(
                  flex: 4,
                  child: FractionallySizedBox(
                      widthFactor: 1,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        heightFactor: 0.75,
                        child: RaisedButton(
                          // color: Colors.yellow[700],
                          //  color: Colors.orange[300],
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: _launchUrl,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 1.4,
                            child: FittedBox(
                              // alignment: Alignment.centerLeft,
                              fit: BoxFit.contain,
                              child: Text(
                                "Mehr erfahren!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )))
// //Materials
//               Flexible(
//                 flex: 2,
//                 child: FractionallySizedBox(
//                   //  widthFactor: 0.2,
//                   heightFactor: 1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     //   crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2,
//                               heightFactor: 1,
//                               child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     SizedBox(
//                                         height:
//                                             SizeConfig.safeBlockVertical * 7),
//                                     Flexible(
//                                         child: FractionallySizedBox(
//                                       widthFactor: 1,
//                                       heightFactor: 1.75,
//                                       child: FittedBox(
//                                         // alignment: Alignment.centerLeft,
//                                         fit: BoxFit.contain,
//                                         child: Text("Materialen:",
//                                             style: TextStyle(
//                                               color:
//                                                   Theme.of(context).accentColor,
//                                               fontWeight: FontWeight.w800,
//                                               // fontSize:
//                                               //     SizeConfig.safeBlockHorizontal *
//                                               //         4.5,
//                                               // height: SizeConfig.safeBlockVertical *
//                                               //     0.25,
//                                             )),
//                                       ),
//                                     )),
//                                     Flexible(
//                                         child: FractionallySizedBox(
//                                       widthFactor: 0.49,
//                                       heightFactor: 1.35,
//                                       child: FittedBox(
//                                           // alignment: Alignment.centerLeft,
//                                           fit: BoxFit.contain,
//                                           child: AutoSizeText(
//                                             product.materials,
//                                             textAlign: TextAlign.center,
//                                             maxLines: 1,
//                                             //overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                               color: Color.fromRGBO(
//                                                   238, 237, 237, 1),
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           )),
//                                     ))
//                                   ]))),
//                     ],
//                   ),
//                 ),
//               ),

// //Drunkness & Funfactor
//               Flexible(
//                 flex: 2,
//                 child: FractionallySizedBox(
//                   //  widthFactor: 0.2,
//                   heightFactor: 1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2,
//                               heightFactor: 1,
//                               child: Column(children: <Widget>[
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                       widthFactor: 0.6,
//                                       heightFactor: 1.5,
//                                       child: FittedBox(
//                                         // alignment: Alignment.centerLeft,
//                                         fit: BoxFit.contain,
//                                         child: Text(
//                                           "Betrinkskala",
//                                           style: TextStyle(
//                                             color:
//                                                 Theme.of(context).accentColor,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                                 Flexible(
//                                     child: FractionallySizedBox(
//                                         widthFactor: 0.5,
//                                         heightFactor: 0.8,
//                                         child: FittedBox(
//                                           // alignment: Alignment.centerLeft,
//                                           fit: BoxFit.contain,
//                                           child: customProgressBar(
//                                               product.drunknessFactor),
//                                         )))
//                               ]))),
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2,
//                               heightFactor: 1,
//                               child: Column(children: <Widget>[
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                       widthFactor: 0.6,
//                                       heightFactor: 1.5,
//                                       child: FittedBox(
//                                         // alignment: Alignment.centerLeft,
//                                         fit: BoxFit.contain,
//                                         child: Text(
//                                           "Spaßfaktor",
//                                           style: TextStyle(
//                                             color:
//                                                 Theme.of(context).accentColor,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                                 Flexible(
//                                     child: FractionallySizedBox(
//                                         widthFactor: 0.5,
//                                         heightFactor: 0.8,
//                                         child: FittedBox(
//                                           // alignment: Alignment.centerLeft,
//                                           fit: BoxFit.contain,
//                                           child: customProgressBar(
//                                               product.funFactor),
//                                         )))
//                               ]))),
//                     ],
//                   ),
//                 ),
//               ),

//               Flexible(
//                 flex: 2,
//                 child: FractionallySizedBox(
//                   //  widthFactor: 0.2,
//                   heightFactor: 1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2,
//                               heightFactor: 1,
//                               child: Column(children: <Widget>[
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                       widthFactor: 0.6,
//                                       heightFactor: 1.5,
//                                       child: FittedBox(
//                                         // alignment: Alignment.centerLeft,
//                                         fit: BoxFit.contain,
//                                         child: Text(
//                                           "Dirty Faktor",
//                                           style: TextStyle(
//                                             color:
//                                                 Theme.of(context).accentColor,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                                 Flexible(
//                                     child: FractionallySizedBox(
//                                         widthFactor: 0.5,
//                                         heightFactor: 0.8,
//                                         child: FittedBox(
//                                           // alignment: Alignment.centerLeft,
//                                           fit: BoxFit.contain,
//                                           child: customProgressBar(
//                                               product.dirtyFactor),
//                                         )))
//                               ]))),
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2,
//                               heightFactor: 1,
//                               child: Column(children: <Widget>[
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                       widthFactor: 0.6,
//                                       heightFactor: 1.5,
//                                       child: FittedBox(
//                                         // alignment: Alignment.centerLeft,
//                                         fit: BoxFit.contain,
//                                         child: Text(
//                                           "Komplexität",
//                                           style: TextStyle(
//                                             color:
//                                                 Theme.of(context).accentColor,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                                 Flexible(
//                                     child: FractionallySizedBox(
//                                         widthFactor: 0.5,
//                                         heightFactor: 0.8,
//                                         child: FittedBox(
//                                           // alignment: Alignment.centerLeft,
//                                           fit: BoxFit.contain,
//                                           child: customProgressBar(
//                                               product.difficulty),
//                                         )))
//                               ]))),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: SizeConfig.blockSizeVertical * 10),
//               Flexible(
//                   flex: 2,
//                   child: FractionallySizedBox(
//                     widthFactor: 0.5,
//                     heightFactor: 0.8,
//                     child: RaisedButton(
//                       // color: Colors.yellow[700],
//                     //  color: Colors.orange[300],
//                     color: Colors.grey[300],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(11.0),
//                           side: BorderSide(
//                               color: Theme.of(context).primaryColor)),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) => customPopupDialog(
//                               context,
//                               product.gameName,
//                               product.explanationList),
//                         );
//                       },
//                       child: FractionallySizedBox(
//                         widthFactor: 1,
//                         heightFactor: 1.1,
//                         child: FittedBox(
//                           // alignment: Alignment.centerLeft,
//                           fit: BoxFit.contain,
//                           child: Text(
//                             "So funktionierts!",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ))
            ],
          ),
        ),
      ),
    );
  }
}
