import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/work_experience.dart';
import 'package:jnee/screens/detail/widgets/card_work_experience.dart';

class DetailWorkExperienceX extends StatelessWidget {
  final List<WorkExperience> listWork;
  const DetailWorkExperienceX(this.listWork, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("--"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              listWork.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return CardWorkExperience(listWork[index]);
                        },
                        childCount: listWork.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text("No registra experiencia laboral"),
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
