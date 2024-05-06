import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';

import 'package:jnee/models/income.dart';
import 'package:jnee/models/inmovable_property.dart';
import 'package:jnee/models/movable_property.dart';
import 'package:jnee/models/ownership.dart';
import 'package:jnee/models/sworn_declaration.dart';

class DetailSwornDeclarationX extends StatelessWidget {
  final SwornDeclaration swornDeclaration;
  const DetailSwornDeclarationX(this.swornDeclaration, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("swo"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      color: kDarkBlue,
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(
                          child: Text(
                        "INGRESOS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Incomes(swornDeclaration.ingreso),
                    Container(
                      color: kDarkBlue,
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(
                          child: Text(
                        "Bienes Inmuebles del Declarante",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    InmovablePropertys(swornDeclaration.bienInmueble),
                    Container(
                      color: kDarkBlue,
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(
                          child: Text(
                        "Bienes Muebles del Declarante",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    MovablePropertys(swornDeclaration.bienMueble),
                    Container(
                      color: kDarkBlue,
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(
                          child: Text(
                        "TITULARIDAD DE ACCIONES",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Ownerships(swornDeclaration.titularidad),
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
    //             "INGRESOS",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )),
    //         ),
    //         Incomes(swornDeclaration.ingreso),
    //         Container(
    //           color: Colors.teal,
    //           child: const Center(
    //               child: Text(
    //             "TITULARIDAD DE ACCIONES",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )),
    //         ),
    //         Ownerships(swornDeclaration.titularidad),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class Incomes extends StatelessWidget {
  final List<Income> data;
  const Incomes(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 210,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text(
                          "Año declarado : ${data[index].anioIngresos}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Table(
                          //border: TableBorder.,
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                            //2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RemuBrutaPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    width: 32,
                                    child: Text(
                                      "${data[index].remuBrutaPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RemuBrutaPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].remuBrutaPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RentaIndividualPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].rentaIndividualPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RentaIndividualPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].rentaIndividualPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "OtroIngresoPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].otroIngresoPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "OtroIngresoPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].otroIngresoPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              children: <Widget>[
                                Container(),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                    right: 4.0,
                                  ),
                                  child: Text(
                                    "S/. ${data[index].totalIngresos}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra ingresos"),
          );
  }
}

class InmovablePropertys extends StatelessWidget {
  final List<InmovableProperty> data;
  const InmovablePropertys(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 300,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Table(
                          //border: TableBorder.,
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            //0: FixedColumnWidth(140),
                            1: FlexColumnWidth(),
                            //2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Tipo de bien :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    width: 32,
                                    child: Text(
                                      "${data[index].tipoBienInmueble}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Dirección :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].inmuebleDireccion}",
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Inscrito en SUNARP :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].inmuebleSunarpDesc}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Partida :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].partidaSunarp}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Valor :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].flValor}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Valor autovaluo S/:",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].autovaluo}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.maxFinite,
                          color: Colors.grey[200],
                          child: Text(
                            "Información Complementaria: ${data[index].comentario}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra Bienes Inmuebles"),
          );
  }
}

class MovablePropertys extends StatelessWidget {
  final List<MovableProperty> data;
  const MovablePropertys(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 280,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Table(
                          //border: TableBorder.,
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            //0: FixedColumnWidth(140),
                            1: FlexColumnWidth(),
                            //2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Vehículo :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    width: 32,
                                    child: Text(
                                      "${data[index].vehiculo}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Placa :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].placa}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Características :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].caracteristica}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "Valor S/:",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].valor}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.maxFinite,
                          color: Colors.grey[200],
                          child: Text(
                            "Información Complementaria: ${data[index].comentario}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra Bienes Muebles"),
          );
  }
}

class Ownerships extends StatelessWidget {
  final List<Ownership> data;
  const Ownerships(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 140,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "${data[index].txPersonaJuridica}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Tipo : ${data[index].txTipoTitularidad}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CANTIDAD"),
                                  Text(
                                    "${data[index].flCantidad}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("VALOR"),
                                  Text(
                                    "${data[index].flValor}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra Titularidad de Acciones"),
          );
  }
}
