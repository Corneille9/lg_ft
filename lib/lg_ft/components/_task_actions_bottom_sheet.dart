import 'package:flutter/material.dart';
import 'package:lg_ft/lg_ft/components/_custom_widgets.dart';

class TaskActionsBottomSheet{

  static void show({required BuildContext context}){
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((builder) => _build(context: context)),
    );
  }

  static Widget _build({required BuildContext context}){
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      children: [
        Center(
          child: Container(width: 60, height: 7,decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Anuuler")
                      ),
                      const Text("Backlog", style: TextStyle(fontSize: 20),),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskActionBuilder(name: "Dupliquer la liste", onTap: () {},),
                          const Divider(),
                          TaskActionBuilder(name: "Renommer la liste", onTap: () {},),
                          const Divider(),
                          TaskActionBuilder(name: "Deplacer toutes les taches de la liste", onTap: () {},),
                          const Divider(),
                          TaskActionBuilder(name: "Supprimer la liste", onTap: () {},),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}