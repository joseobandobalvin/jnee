import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jnee/models/hearing/hearing.dart';

class CardHearing extends StatelessWidget {
  final Hearing hearing;
  const CardHearing(this.hearing, {super.key});

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;

    return Center(
      child: Stack(
        children: <Widget>[
          Card(
            color: kDarkBlue,
            child: Container(
              alignment: Alignment.center,
              width: darkCardWidth,
              height: 140,
              child: Row(
                children: [
                  //Foto de la audiencia
                  Container(
                    width: 90,
                    height: 140,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (hearing.urlVideo!.isNotEmpty) {
                              if (!await launchUrl(
                                  Uri.parse(hearing.urlVideo!))) {
                                throw Exception(
                                    'Could not launch ${hearing.urlVideo!}');
                              }
                            }
                          },
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: hearing.urlVideo!.isNotEmpty
                                ? const Image(
                                    image:
                                        AssetImage('assets/images/youtube.png'))
                                : const Image(
                                    image: AssetImage(
                                        'assets/images/youtube-off.png')),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Detalle de la audiencia
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 4.0),
                          // Url video audiencia
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.info_outline_sharp),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  maxLines: 1,
                                  hearing.urlVideo!.isNotEmpty
                                      ? hearing.urlVideo!
                                      : "No hay registro de video",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          // hearing.urlVideo!.isEmpty
                          //     ? Row(
                          //         children: [
                          //           const Expanded(
                          //             flex: 1,
                          //             child: Icon(Icons.info_outline_sharp),
                          //           ),
                          //           Expanded(
                          //             flex: 4,
                          //             child: Text(
                          //               maxLines: 1,
                          //               hearing.urlVideo!.isNotEmpty
                          //                   ? hearing.urlVideo!
                          //                   : "No hay registro de video",
                          //               overflow: TextOverflow.ellipsis,
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : const SizedBox(
                          //         height: 0.0,
                          //       ),

                          const SizedBox(height: 4.0),
                          // Detalle audiencia por ID
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.picture_as_pdf_sharp),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  maxLines: 1,
                                  hearing.txArchivo.isNotEmpty
                                      ? hearing.txArchivo!
                                      : "Sin Detalle",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          // Resultado votacion
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.description_sharp),
                              ),
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (hearing.txHojaVotacion!.isNotEmpty) {
                                      if (!await launchUrl(Uri.parse(
                                          "https://portal.jne.gob.pe${hearing.txHojaVotacion!}"))) {
                                        throw Exception(
                                            'Could not launch ${hearing.txHojaVotacion!}');
                                      }
                                    }
                                  },
                                  child: Text(
                                    maxLines: 1,
                                    hearing.txHojaVotacion!.isNotEmpty
                                        ? "https://portal.jne.gob.pe${hearing.txHojaVotacion!}"
                                        : "Sin Resultado de Votacion",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 4.0),
                          // Container(
                          //   width: 3.0,
                          //   height: 3.0,
                          //   //color: Colors.amber,
                          //   decoration: const BoxDecoration(
                          //     color: Colors.white,
                          //     shape: BoxShape.circle,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Fecha Hora audiencia
          Positioned(
            top: null,
            bottom: 0,
            left: (0.1 * darkCardWidth),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: kLightBlue,
              child: Container(
                width: darkCardWidth * 0.8,
                height: 47,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          hearing.txFecha!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.schedule_outlined),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          hearing.txHora!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
