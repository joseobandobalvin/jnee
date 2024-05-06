import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/elective_position.dart';
import 'package:jnee/models/partial_position.dart';
import 'package:jnee/models/trajectory.dart';
import 'package:jnee/screens/detail/widgets/card_trajectory.dart';

class DetailTrajectoryX extends StatelessWidget {
  final Trajectory trajectory;
  const DetailTrajectoryX(this.trajectory, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("tra"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "CARGOS PARTIDARIOS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    PartialPos(trajectory.cargoPartidario),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "CARGOS ELECCIÓN POPULAR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    ElectionPos(trajectory.cargoEleccion),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    // return SliverStickyHeader(
    //   sliver: SliverToBoxAdapter(
    //     child: Column(
    //       children: [
    //         Container(
    //           color: Colors.teal,
    //           child: const Center(
    //               child: Text(
    //             "CARGO PARTIDARIO",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )),
    //         ),
    //         PartialPos(trajectory.cargoPartidario),
    //         Container(
    //           color: Colors.teal,
    //           child: const Center(
    //               child: Text(
    //             "CARGO ELECCIÓN",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )),
    //         ),
    //         ElectionPos(trajectory.cargoEleccion),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class PartialPos extends StatelessWidget {
  final List<PartialPosition> data;
  const PartialPos(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 160,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 370,
                    color: Colors.amber,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Periodo",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${data[index].anioCargoPartiDesde} - ${data[index].anioCargoPartiHasta}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "${data[index].orgPolCargoPartidario}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${data[index].cargoPartidario}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra cargos partidarios"),
          );
  }
}

class ElectionPos extends StatelessWidget {
  final List<ElectivePosition> data;
  const ElectionPos(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 160,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 370,
                    color: Colors.amber,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Periodo",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${data[index].anioCargoElecDesde} - ${data[index].anioCargoElecHasta}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "${data[index].orgPolCargoElec}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${data[index].cargoEleccion}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra cargos de elección"),
          );
  }
}
