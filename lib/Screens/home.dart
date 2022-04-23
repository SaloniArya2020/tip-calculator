import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _billController = TextEditingController();
  TextEditingController _splitController = TextEditingController();

  double amountPerPerson = 0;
  double totalBill = 0;
  double calTip = 0;
  int tipVal = 10;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    Widget tipButton() {
      return TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              shadowColor: kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              shape: StadiumBorder()),
          onPressed: () {},
          child: Text(
            '10 %',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ));
    }

    // Calculate function
    calculate(){

      double _billAmount = double.parse(_billController.text.trim());
      int person = int.parse(_splitController.text.trim());

      setState(() {
        calTip = (_billAmount * tipVal/100) / person;
        totalBill = _billAmount/person;

        amountPerPerson = calTip + totalBill;
      });
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                child: Image.asset('assets/images/background.png'),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    child: Text(
                      'Tipsy',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: kPrimaryDarkColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Enter bill total',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                  ),

                  // Bill Amount Field
                  Container(
                    width: size.width * 0.5,
                    child: TextField(
                      controller: _billController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          hintText: '\$ Bill Amount',
                          hintStyle: TextStyle(
                            fontSize: 30,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'Choose tip',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                  ),

                  // Choose tip Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:  tipVal== 10? kPrimaryColor: Colors.grey,
                              shadowColor: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              shape: StadiumBorder()),
                          onPressed: () {
                            setState(() {
                              tipVal = 10;
                            });
                          },
                          child: Text(
                            '10 %',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:  tipVal== 15? kPrimaryColor: Colors.grey,
                              shadowColor: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              shape: StadiumBorder()),
                          onPressed: () {
                            setState(() {
                              tipVal = 15;
                            });
                          },
                          child: Text(
                            '15 %',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: tipVal== 20? kPrimaryColor: Colors.grey,
                              shadowColor: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              shape: StadiumBorder()),
                          onPressed: () {
                            setState(() {
                              tipVal = 20;
                            });
                          },
                          child: Text(
                            '20 %',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),

                  // DropDown TipVal
                  // DropdownButton(
                  //     value: '$tipVal%',
                  //     elevation: 15,
                  //     style: TextStyle(
                  //       color: kPrimaryDarkColor,
                  //       fontSize: 18
                  //     ),
                  //     underline: Container(
                  //       height: 2,
                  //       color: kPrimaryDarkColor,
                  //     ),
                  //     items: <dynamic>['10%', '15%', '20%']
                  //         .map<DropdownMenuItem<dynamic>>(( value) {
                  //       return DropdownMenuItem<dynamic>(
                  //         value: value,
                  //         child: Text(value.toString()),
                  //       );
                  //     }).toList(),
                  //     onChanged: (dynamic newVal) {
                  //
                  //       String val = newVal.toString().substring(0, newVal.toString().length -1);
                  //
                  //       setState(() {
                  //         tipVal = int.parse(val);
                  //       });
                  //       print(tipVal);
                  //     }),

                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'Split',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                  ),

                  // Split Person
                  Container(
                    width: size.width * 0.5,
                    child: TextField(
                      controller: _splitController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          hintText: 'Number of person',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //Calculate Button
                  TextButton(
                    onPressed: calculate,
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  //  Result Container
                  Container(
                    height: size.height * 1,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Text(
                            'Total per person',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20),
                          ),
                        ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        Text(
                          '\$' + amountPerPerson.toStringAsFixed(2),
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: size.height * 0.03,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('bill',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                )),
                            Text('tip',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('\$ '+ totalBill.toStringAsFixed(2),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                )),
                            Text('\$'+ calTip.toStringAsFixed(2),
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
