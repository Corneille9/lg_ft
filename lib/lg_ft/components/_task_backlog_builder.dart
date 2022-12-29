import 'package:flutter/material.dart';
import 'package:lg_ft/lg_ft/components/_task_actions_bottom_sheet.dart';
import 'package:lg_ft/lg_ft/components/_task_item_builder.dart';

class TaskBacklogBuilder extends StatelessWidget {
  const TaskBacklogBuilder({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              IconButton(
                  onPressed: () {
                    TaskActionsBottomSheet.show(context: context);
                  },
                  icon: const Icon(Icons.menu_rounded)
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) => TaskItemBuilder(index: index,),
          ),
          TextButton(
              onPressed: () {

              },
              child: Row(
                children: const [
                  Icon(Icons.add),
                  Text("Ajouter une tache")
                ],
              )
          )
        ],
      ),
    );
  }
}
