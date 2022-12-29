import 'package:flutter/material.dart';
import 'package:lg_ft/lg_ft/components/_custom_widgets.dart';
import 'package:lg_ft/lg_ft/components/_new_task_backlog_builder.dart';
import 'components/_task_backlog_builder.dart';

class TaskBackLogListScreen extends StatelessWidget {
  TaskBackLogListScreen({Key? key}) : super(key: key);

  //Use to notify searchTextField visibility
  final ValueNotifier<bool> showSearchField = ValueNotifier(false);

  final ValueNotifier<List<Widget>> taskBacklogs = ValueNotifier([const TaskBacklogBuilder()]);

  final ScrollController scrollController = ScrollController();

  bool scrollToEnd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Taches", style: TextStyle(),),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder(
                  valueListenable: showSearchField,
                  builder: (context, value, child) {


                    if(!showSearchField.value){
                      ///Return this when searchTextField is not visible
                      return IconButton(
                          onPressed: () {
                            showSearchField.value = true;
                          },
                          icon: Icon(Icons.arrow_circle_right_outlined, color: Theme.of(context).iconTheme.color?.withOpacity(0.5))
                      );
                    }

                    ///Return searchTextField if visible
                    return Expanded(
                      child: CustomTextField(
                        hintText: "Rechercher.....",
                        suffixIcon: InkWell(
                          onTap: () {
                            showSearchField.value = false;
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      ///Add new taskBacklog , See [NewTaskBackLogBuilder]
                      taskBacklogs.value = taskBacklogs.value +  [NewTaskBackLogBuilder()];
                      ///Use to prevent taskBacklogs listview scroll end
                      scrollToEnd = true;
                    },
                    icon: Icon(Icons.add_box_outlined, color: Theme.of(context).iconTheme.color?.withOpacity(0.5),)
                )
              ],
            ),
            const SizedBox(height: 15,),
            ValueListenableBuilder(
                valueListenable: taskBacklogs,
                builder: (context, value, child) {

                  if(scrollToEnd){
                    ///Scroll end when new taskBackLog added
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      _scrollDown();
                      scrollToEnd = false;
                    });
                  }

                  return Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskBacklogs.value.length,
                      itemBuilder: (context, index) {
                        return taskBacklogs.value[index];
                      },
                    ),
                  );
                },
            )
          ],
        ),
      ),
    );
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
