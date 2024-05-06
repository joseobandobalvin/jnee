import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/sentence.dart';
import 'package:jnee/screens/detail/widgets/card_sentence.dart';

import 'package:jnee/screens/detail/widgets/card_work_experience.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/work_experience.dart';
import 'package:jnee/screens/detail/widgets/card_work_experience.dart';

class DetailSentenceX extends StatelessWidget {
  final List<Sentence> listSentence;
  const DetailSentenceX(this.listSentence, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("sentence"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              listSentence.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return CardSentence(listSentence[index]);
                        },
                        childCount: listSentence.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text("No registra Antecedentes Penales"),
                      ),
                    ),
            ],
          );
        },
      ),
    );
    // return SliverStickyHeader(
    //   sliver: listWork.isNotEmpty
    //       ? SliverList(
    //           delegate: SliverChildBuilderDelegate(
    //             (BuildContext context, int index) {
    //               return CardWorkExperience(listWork[index]);
    //             },
    //             childCount: listWork.length,
    //           ),
    //         )
    //       : SliverToBoxAdapter(
    //           child: Container(
    //             margin: const EdgeInsets.all(10.0),
    //             child: const Text("No registra experiencia laboral"),
    //           ),
    //         ),
    // );
  }
}


// class DetailSentenceX extends StatelessWidget {
//   final List<Sentence> listSentence;
//   const DetailSentenceX(this.listSentence, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverStickyHeader(
//       header: Container(
//         height: 40.0,
//         color: kDarkBlue,
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         alignment: Alignment.centerLeft,
//         child: Row(
//           children: [
//             const Icon(Icons.work_history_outlined),
//             Text(
//               ' Experiencia laboral (${listSentence.length})',
//               style: const TextStyle(color: Colors.white),
//             )
//           ],
//         ),
//       ),
//       sliver: listSentence.isNotEmpty
//           ? SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return CardSentence(listSentence[index]);
//                 },
//                 childCount: listSentence.length,
//               ),
//             )
//           : SliverToBoxAdapter(
//               child: Container(
//                 margin: const EdgeInsets.all(10.0),
//                 child: const Text("No registra Antecedentes Penales"),
//               ),
//             ),
//     );
//   }
// }
