import 'package:finance_app/animation/fade_in.dart';
import 'package:finance_app/widgets/bank_card.dart';
import 'package:finance_app/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:iconly/iconly.dart';

class HistoryPage extends StatelessWidget {
  final CardDetail cardDetail;
  static route({required CardDetail cardDetail}) => MaterialPageRoute(
        builder: (context) => HistoryPage(
          cardDetail: cardDetail,
        ),
      );
  const HistoryPage({
    super.key,
    required this.cardDetail,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 25, bottom: 25, right: 20),
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: size.width,
                  height: size.height * 0.45,
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 700),
                  right: 15,
                  top: 25,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fixedSize: Size(
                            size.width * 0.38,
                            size.height * 0.08,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              IconlyBold.arrow_up_2,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '\$6,640',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fixedSize: Size(
                            size.width * 0.38,
                            size.height * 0.08,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(IconlyBold.arrow_down_2, color: Colors.white),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '\$4,520',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: -110,
                  child: Row(
                    children: [
                      Transform.rotate(
                        angle: -math.pi / 2,
                        child: SizedBox(
                          height: 220,
                          width: size.height * 0.4,
                          child: FadeInAnimation(
                            delay: 2,
                            direction: FadeInDirection.ttb,
                            fadeOffset: 60,
                            child: BankCard(
                              cardBgAsset: cardDetail.cardBgAsset,
                              balance: cardDetail.balance,
                              cardNumber: cardDetail.cardNumber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
