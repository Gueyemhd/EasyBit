import 'package:flutter/material.dart';

class Evolution extends StatelessWidget {
  const Evolution({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Top Evolutions',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(234, 234, 244, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: const Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'max: 13507603 XOF',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Last Week',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 5,
                        MediaQuery.of(context).size.height / 18,
                        0,
                        0),
                    child: Image.asset("images/increase.png"),
                  )
                ]),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(234, 234, 244, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: const Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'min: 10502803 XOF',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Last Week',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 5,
                          MediaQuery.of(context).size.height / 19,
                          0,
                          0),
                      child: Image.asset("images/decrease.png"),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height / 10.5, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.32,
                  MediaQuery.of(context).size.height / 13,
                  0,
                  0),
            ),
          ],
        )
      ],
    );
  }
}
