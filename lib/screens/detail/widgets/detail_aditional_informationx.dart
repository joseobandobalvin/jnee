import 'package:flutter/material.dart';

import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/aditional_information.dart';
import 'package:jnee/screens/detail/widgets/card_aditional_information.dart';

class DetailAditionalInformationX extends StatelessWidget {
  final List<AditionalInformation> listAditionalInformation;
  const DetailAditionalInformationX(this.listAditionalInformation, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("AditionalInf"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              listAditionalInformation.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return CardAditionalInformation(
                              listAditionalInformation[index]);
                        },
                        childCount: listAditionalInformation.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text("No registra información adicional"),
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
