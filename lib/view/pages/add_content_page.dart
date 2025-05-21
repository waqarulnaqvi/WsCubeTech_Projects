import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/core/theme/app_gradients.dart';
import 'package:todo_app_cubit/model/todo_model.dart';
import 'package:todo_app_cubit/utils/priority_type.dart';
import 'package:todo_app_cubit/view/widgets/global_widgets.dart';
import 'package:todo_app_cubit/view/widgets/text_view/reusable_text_field.dart';
import 'package:todo_app_cubit/viewmodel/cubit/todo_cubit.dart';

import '../widgets/button/custom_drop_down_button.dart';

class AddContentPage extends StatefulWidget {
  final TodoModel? todoModel;

  const AddContentPage({super.key, this.todoModel});

  @override
  State<AddContentPage> createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isUpdateContent();
  }

  void isUpdateContent() {
    if (widget.todoModel != null) {
      titleController.text = widget.todoModel!.title;
      descriptionController.text = widget.todoModel!.description;
      isChecked = widget.todoModel!.isCompleted;
      context.read<TodoCubit>().priority = PriorityType.intToString(widget.todoModel!.priority);
    }
  }

  @override
  Widget build(BuildContext context) {
    var rCubit=context.read<TodoCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Add Content')),
      body: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppGradients.skyBlueMyAppGradient,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Content",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              spacerH(),
              ReusableTextField(controller: titleController, hintText: "Title"),
              spacerH(),
              ReusableTextField(
                controller: descriptionController,
                hintText: "Description",
              ),
              spacerH(),
              Row(
                children: [
                  Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  spacerW(10),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    focusColor: Colors.white,
                    // activeColor: Colors.white,
                    // checkColor: Colors.blue,
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                ],
              ),
              spacerH(),
              CustomDropDownButton(
                heading: context.watch<TodoCubit>().priority,
                onChanged: (value) {
                  if (value != null) {
                    // print("Selected index: $value");
                    // Set the filter in the cubit
                    // print(rCubit.priority);

                    rCubit.changePriority= value;
                    // print(rCubit.priority);
                  }
                },
                categories: PriorityType.values.map((e) => e.value).toList(),
              ),
              spacerH(),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      descriptionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill title and description"),
                        backgroundColor: Colors.black,
                      ),
                    );
                    return;
                  }

                  if (widget.todoModel != null) {
                    context.read<TodoCubit>().updateData(
                      TodoModel(
                        id: widget.todoModel!.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        priority: PriorityType.stringToInt(rCubit.priority),
                        isCompleted: isChecked,
                      ),
                    );
                  } else {



                    context.read<TodoCubit>().addData(
                      TodoModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        priority: PriorityType.stringToInt(rCubit.priority),
                        isCompleted: isChecked,
                      ),
                    );
                  }
                  Navigator.pop(context);

                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
