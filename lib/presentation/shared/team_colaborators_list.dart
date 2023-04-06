import 'package:devpaul_co/presentation/shared/team_colaborator_card.dart';
import 'package:flutter/material.dart';

class TeamColaboratorsList extends StatelessWidget {
  const TeamColaboratorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TeamColaboratorCard(
              name: 'Jimmy Realpe',
              email: 'jimmyarg87@gmail.com',
              phone: '+57 3125035306',
              profession: 'Mobile Developer',
              imagePath: 'jimmy.jpeg',
              delay: 100,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 18),
              height: 65,
              width: 2.5,
              decoration: BoxDecoration(
                  color: const Color(0xff2D69FD),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const TeamColaboratorCard(
              name: 'Rafael Belalcázar',
              email: 'rafabeldev@gmail.com',
              phone: '+57 3214153856',
              profession: 'Data Scientist',
              imagePath: 'rafael.jpeg',
              delay: 300,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 18),
              height: 65,
              width: 2.5,
              decoration: BoxDecoration(
                  color: const Color(0xff2D69FD),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const TeamColaboratorCard(
              name: 'Víctor Pinto',
              email: 'victorp2304.pro@gmail.com',
              phone: '+57 3154230459',
              profession: 'Web Developer',
              imagePath: 'victor.jpg',
              delay: 600,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Divider(),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const TeamColaboratorCard(
        //       name: 'Andrés Bravo',
        //       email: 'afbravo.p5@gmail.com',
        //       phone: '+57 3014312013',
        //       profession: 'Mobile Developer',
        //       imagePath: 'devpaul.jpg',
        //     ),
        //     Container(
        //       margin: const EdgeInsets.only(left: 40, right: 18),
        //       height: 65,
        //       width: 2.5,
        //       decoration: BoxDecoration(
        //           color: const Color(0xff2D69FD),
        //           borderRadius: BorderRadius.circular(12)),
        //     ),
        //     const TeamColaboratorCard(
        //       name: 'Michael Pardo',
        //       email: 'jimmyarg87@gmail.com',
        //       phone: '+57 3125035306',
        //       profession: 'Mobile Developer',
        //       imagePath: 'devpaul.jpg',
        //     ),
        //     Container(
        //       margin: const EdgeInsets.only(left: 40, right: 18),
        //       height: 65,
        //       width: 2.5,
        //       decoration: BoxDecoration(
        //           color: const Color(0xff2D69FD),
        //           borderRadius: BorderRadius.circular(12)),
        //     ),
        //     const TeamColaboratorCard(
        //       name: 'Jimmy Realpe',
        //       email: 'jimmyarg87@gmail.com',
        //       phone: '+57 3125035306',
        //       profession: 'Mobile Developer',
        //       imagePath: 'devpaul.jpg',
        //     ),
        //   ],
        // ),
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 6),
        //   child: Divider(),
        // ),
      ],
    );
  }
}
