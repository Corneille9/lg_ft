import 'package:flutter/material.dart';
import 'package:lg_ft/lg_ft/components/_task_item_builder.dart';

import '_custom_widgets.dart';

class NewTaskBackLogBuilder extends StatelessWidget {
  NewTaskBackLogBuilder({Key? key, this.onAddTask}) : super(key: key);

  final ValueNotifier<List<Widget>> tasks = ValueNotifier([]);

  ///Call this when new task added [Scroll down taskBacklogs listview]
  final VoidCallback? onAddTask;

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
          const CustomTextField(
            hintText: "???????",
          ),
          ValueListenableBuilder(
              valueListenable: tasks,
              builder: (context, value, child) {

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  onAddTask?.call();
                });

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.value.length,
                  itemBuilder: (context, index) => tasks.value[index],
                );
              },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("Annuler")
              ),
              TextButton(
                  onPressed: () {
                    /// Add add new task to taskBacklog |??????????????????????????????????????
                    tasks.value = tasks.value + [TaskItemBuilder(index: tasks.value.length)];
                  },
                  child: const Text("Ajouter")
              )
            ],
          )
        ],
      ),
    );
  }
}
