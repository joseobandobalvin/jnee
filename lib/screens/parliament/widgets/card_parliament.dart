import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/cv.dart';
import 'package:jnee/models/parliament/parliament.dart';
import 'package:jnee/screens/detail/detail_screen_ex.dart';
import 'package:url_launcher/url_launcher.dart';

class CardParliament extends StatelessWidget {
  final Parliament parliament;
  const CardParliament(this.parliament, {super.key});

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;
    var idHojaVida = parliament.idHojaVida!.toInt();

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
                  //Foto del parlamentario andino
                  GestureDetector(
                    onTap: () => Get.to(() => DetailScreenEx(),
                        arguments: Cv(
                          nombreCompleto:
                              "${parliament.strNombres!} ${parliament.strApellidoPaterno!} ${parliament.strApellidoMaterno!}",
                          idHojaVida: idHojaVida.toDouble(),
                          idOrganizacionPolitica:
                              parliament.idOrganizacionPolitica!.toDouble(),
                        )),
                    child: Container(
                      width: 90,
                      height: 140,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      LinearProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Detalle de la audiencia
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Text(
                            maxLines: 2,
                            "${parliament.strNombres!} ${parliament.strApellidoPaterno!} ${parliament.strApellidoMaterno!}",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4.0),
                          Container(
                            width: 3.0,
                            height: 3.0,
                            //color: Colors.amber,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(height: 4.0),

                          // Detalle audiencia por ID
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
                                    if (parliament.strRutaPlanGob!.isNotEmpty) {
                                      if (!await launchUrl(Uri.parse(
                                          parliament.strRutaPlanGob!))) {
                                        throw Exception(
                                            'Could not launch ${parliament.strRutaPlanGob!}');
                                      }
                                    }
                                  },
                                  child: Text(
                                    maxLines: 1,
                                    parliament.strRutaPlanGob!.isNotEmpty
                                        ? parliament.strRutaPlanGob!
                                        : "Sin plan de gobierno",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          // Resultado votacion
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
                child: Center(
                  child: Text(
                    parliament.strOrganizacionPolitica!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
