import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/core/theme/app_colors.dart';
import 'package:todo_app_cubit/model/todo_model.dart';
import 'package:todo_app_cubit/utils/priority_type.dart';
import 'package:todo_app_cubit/view/widgets/global_widgets.dart';
import '../../../viewmodel/cubit/todo_cubit.dart';
import '../../pages/add_content_page.dart';
import '../painter/folded_corner_painter.dart';

class ReusableFoldedCornerContainer extends StatelessWidget {
  final TodoModel todoModel;

  const ReusableFoldedCornerContainer({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    Color color = Colors.transparent;
    String priorityString = "";
    if (todoModel.priority == PriorityType.low.intValue) {
      color = AppColors.lightBlue;
      priorityString = "Low";
    } else if (todoModel.priority == PriorityType.medium.intValue) {
      color = Colors.yellow.shade200;
      priorityString = "Medium";
    } else if (todoModel.priority == PriorityType.high.intValue) {
      color = AppColors.lightGreen;
      priorityString = "High";
    }

    return Row(
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: theme.onSurface, width: 3.0),
          ),
        ),
        SizedBox(
          width: 8,
          child: Divider(
            thickness: 2, // Set the thickness of the line
            color: theme.onSurface, // Set the color of the line
          ),
        ),
        Expanded(
          child: CustomPaint(
            painter: FoldedCornerPainter(color: color),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 4,
              ),
              // child: RadioListTile(
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: todoModel.isCompleted,
                // groupValue: todoModel.isCompleted,
                onChanged: (value) {
                  // print("Value: $value");
                  if (value == null) return;
                  context.read<TodoCubit>().updateData(
                    TodoModel(
                      title: todoModel.title,
                      description: todoModel.description,
                      priority: todoModel.priority,
                      isCompleted: value,
                      id: todoModel.id,
                    ),
                  );
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      todoModel.title,
                      style: TextStyle(fontSize: 16, color: theme.onSurface),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Priority: $priorityString",
                      style: TextStyle(fontSize: 14, color: theme.onSurface),
                    ),
                  ],
                ),

                subtitle: Text(
                  todoModel.description,
                  style: TextStyle(fontSize: 14, color: theme.onSurface),
                ),

                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    AddContentPage(todoModel: todoModel),
                          ),
                        );
                      },
                      child: Icon(Icons.edit),
                    ),
                    spacerW(5),

                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<TodoCubit>().deleteData(todoModel.id!);
                        // Handle delete action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 35,
          child: Divider(
            thickness: 2, // Set the thickness of the line
            color: theme.onSurface, // Set the color of the line
          ),
        ),
      ],
    );
  }
}
