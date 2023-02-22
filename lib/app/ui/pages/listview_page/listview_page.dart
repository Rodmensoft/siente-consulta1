import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siente_app/app/data/models/remote/vista_lista.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';
import 'package:siente_app/app/ui/pages/listview_page/local_widgets/proyects_card.dart';

import '../../global_widgets/fadein_top_edge.dart';
import 'listview_controller.dart';

class ListViewPage extends GetView<ListViewController> {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'lista_proyectos',
      builder: (_) {
        return FadeInEdgesVertical(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _.listaProyectos.length,
            itemBuilder: (BuildContext context, int index) {
              final VistaListaConsulta data = _.listaProyectos[index];
              return ProyectCard(
                index: index,
                codigoProyecto: data.codigoproyecto,
                avanceProyecto: data.avanceproyecto,
                imagenCategoria: data.urlImageCategoria,
                nombreProyecto: data.nombreproyecto,
                nombreCategoria: data.formattedNombreCat,
                valorProyecto: data.valorproyecto,
                distanciaProyecto: data.distaciaproyecto,
                colorCategoria: data.colorCategoria,
                semaforo: data.semaforoproyecto,
              );
            },
          ),
        );
      },
    );
  }
}
