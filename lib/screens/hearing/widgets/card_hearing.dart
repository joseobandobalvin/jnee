import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';

import 'package:jnee/models/hearing/hearing.dart';

class CardHearing extends StatelessWidget {
  final Hearing hearing;
  const CardHearing(this.hearing, {super.key});

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;

    return GestureDetector(
      onTap: () {},
      child: Center(
        //padding: const EdgeInsets.all(2.0),
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
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://portal.jne.gob.pe/portal/recursos/image/youtube.jpg",
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
                    //Detalle de la audiencia
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        //color: kDarkBlue,
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0),
                            Text(
                              maxLines: 2,
                              hearing.txFecha!,
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
                            Text(
                              hearing.txHora!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
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
                      hearing.urlVideo!.isNotEmpty
                          ? hearing.urlVideo!
                          : "No hay registro",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
