import 'package:finance_app/animation/fade_in.dart';
import 'package:finance_app/pages/history_page.dart';
import 'package:finance_app/theme_notifier.dart';
import 'package:finance_app/widgets/bank_card.dart';
import 'package:finance_app/widgets/card_detail.dart';
import 'package:finance_app/widgets/contact.dart';
import 'package:finance_app/widgets/home_buttons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context, listen: false);
    const cardDetails = [
      CardDetail(
        cardBgAsset: 'assets/card1bg.jpg',
        balance: '200,000.60',
        cardNumber: '4657',
      ),
      CardDetail(
          cardBgAsset: 'assets/card3bg.jpg',
          balance: '848,900.30',
          cardNumber: '3486'),
      CardDetail(
          cardBgAsset: 'assets/card2bg.jpg',
          balance: '350,800.90',
          cardNumber: '6343'),
    ];
    final contactsList = [
      Contact(
          color: Colors.red.withOpacity(0.1),
          name: 'Toya Smith',
          amount: '50.60',
          profileAsset: 'assets/avatar1.jpg'),
      Contact(
          color: Colors.teal.withOpacity(0.1),
          name: 'Tom Hardy',
          amount: '80.20',
          profileAsset: 'assets/avatar2.jpg'),
      Contact(
          color: Colors.purple.withOpacity(0.1),
          name: 'John Wick',
          amount: '200.90',
          profileAsset: 'assets/avatar3.jpg'),
      Contact(
          color: Colors.orange.withOpacity(0.1),
          name: 'Brad Smith',
          amount: '60.70',
          profileAsset: 'assets/avatar4.jpg'),
    ];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      children: [
        FadeInAnimation(
          delay: 2,
          direction: FadeInDirection.ttb,
          fadeOffset: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Welcome back',
              ),
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.deepPurple.shade100,
                child: Image.asset(
                  'assets/avatar.png',
                ),
              ),
            ],
          ),
        ),
        const FadeInAnimation(
          delay: 2,
          direction: FadeInDirection.ttb,
          fadeOffset: 40,
          child: Text(
            'Hi, Nikhil',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeInAnimation(
          delay: 3.5,
          direction: FadeInDirection.ltr,
          fadeOffset: 40,
          child: SizedBox(
            height: 260,
            child: CardSwiper(
              padding: const EdgeInsets.symmetric(vertical: 20),
              cardBuilder: (
                context,
                index,
                horizontalOffsetPercentage,
                verticalOffsetPercentage,
              ) {
                final cardDetail = cardDetails[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context, HistoryPage.route(cardDetail: cardDetail)),
                  child: BankCard(
                      cardBgAsset: cardDetail.cardBgAsset,
                      balance: cardDetail.balance,
                      cardNumber: cardDetail.cardNumber),
                );
              },
              cardsCount: cardDetails.length,
              isLoop: true,
              numberOfCardsDisplayed: 3,
              scale: 0.95,
              backCardOffset: const Offset(18, -15),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildHomeButtons(),
        const SizedBox(height: 30),
        const FadeInAnimation(
          delay: 3,
          direction: FadeInDirection.btt,
          fadeOffset: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Send Money',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('See all'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: contactsList.length,
            itemBuilder: (context, index) {
              final contact = contactsList[index];
              return FadeInAnimation(
                direction: FadeInDirection.rtl,
                delay: 2.0 + index,
                fadeOffset: index == 0 ? 80 : 80.0 * index,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                  decoration: BoxDecoration(
                    color: themeData.getTheme() == themeData.darkTheme
                        ? Colors.white12
                        : contact.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          maxRadius: 25,
                          foregroundImage: AssetImage(contact.profileAsset)),
                      const SizedBox(height: 5),
                      Text(
                        contact.name,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${contact.amount}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15),
          ),
        )
      ],
    );
  }

  Row _buildHomeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInAnimation(
          delay: 1,
          fadeOffset: 60,
          direction: FadeInDirection.ltr,
          child: HomeButton(
            label: "Transfer",
            iconData: IconlyBold.swap,
            color: Colors.teal,
            onPressed: () {},
          ),
        ),
        FadeInAnimation(
          delay: 2.5,
          fadeOffset: 220,
          direction: FadeInDirection.ltr,
          child: HomeButton(
            label: "Voucher",
            iconData: IconlyBold.discount,
            color: Colors.orange,
            onPressed: () {},
          ),
        ),
        FadeInAnimation(
          delay: 3.5,
          fadeOffset: 300,
          direction: FadeInDirection.ltr,
          child: HomeButton(
            label: "Bill",
            iconData: IconlyBold.document,
            color: Colors.purpleAccent.shade100,
            onPressed: () {},
          ),
        ),
        FadeInAnimation(
          delay: 4.5,
          fadeOffset: 360,
          direction: FadeInDirection.ltr,
          child: HomeButton(
            label: "Send",
            iconData: IconlyBold.user_3,
            color: Colors.teal,
            onPressed: () {},
          ),
        ),
        FadeInAnimation(
          delay: 5.5,
          fadeOffset: 440,
          direction: FadeInDirection.ltr,
          child: HomeButton(
            label: "More",
            iconData: IconlyBold.more_circle,
            color: Colors.red,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
