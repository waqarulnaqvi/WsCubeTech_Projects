import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../global_widgets.dart';

class CustomDropDownButton extends StatelessWidget {
  final String heading;
  final List<String> categories;
  final Function(dynamic) onChanged;

  const CustomDropDownButton({super.key, required this.heading,required this.categories, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButton2(
          customButton: Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(Icons.filter_list),
                spacerW(15),
                Text(
                  heading,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ),

          items:categories
              // content
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          height: 0,
                          letterSpacing: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                  .toList(),

          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          onChanged : onChanged

          //     (index) {
          //   if (index != null) {
          //     // Set the filter in the cubit
          //     rCubit.changeFilter = FilterEnum.values[index].value;
          //   }
          // },
        ),
      ),
    );
  }
}

// onChanged: (value) {
//   if (value == 1) {
//     // context.read<TodoCubit>().fetchData();
//   } else if (value == 2) {
//     // context.read<TodoCubit>().fetchCompletedTodos();
//   } else if (value == 3) {
//     // context.read<TodoCubit>().fetchNotCompletedTodos();
//   } else if (value == 4) {
//     // context.read<TodoCubit>().fetchHighPriorityTodos();
//   } else if (value == 5) {
//     // context.read<TodoCubit>().fetchMediumPriorityTodos();
//   } else if (value == 6) {
//     // context.read<TodoCubit>().fetchLowPriorityTodos();
//   }
// },
