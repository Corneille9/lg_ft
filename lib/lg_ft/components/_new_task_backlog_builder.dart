import 'package:flutter/material.dart';

import '_custom_widgets.dart';

class NewTaskBackLogBuilder extends StatelessWidget {
  NewTaskBackLogBuilder({Key? key, this.onAdd}) : super(key: key);

  final ValueNotifier<List<Widget>> tasks = ValueNotifier([]);

  ///Call this when new task added [Scroll down taskBacklogs listview]
  final Function(String name)? onAdd;

  final TextEditingController controller = TextEditingController();

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
          CustomTextField(
            hintText: "???????",
            controller: controller,
          ),
          ValueListenableBuilder(
              valueListenable: tasks,
              builder: (context, value, child) {
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
                    /// Add add new taskBacklog to taskBacklogList |??????????????????????????????????????
                    if(controller.text.trim().isEmpty)return;
                    onAdd?.call(controller.text);
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
