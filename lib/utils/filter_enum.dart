
enum FilterEnum {
  allTodos,
  completed,
  notCompleted,
  highPriority,
  mediumPriority,
  lowPriority;

  // Add more filter options as needed
  String get value{
    switch (this) {
      case FilterEnum.allTodos:
        return 'All Todos';
      case FilterEnum.completed:
        return 'Only Completed';
      case FilterEnum.notCompleted:
        return 'Not Completed';
      case FilterEnum.highPriority:
        return 'High Priority';
      case FilterEnum.mediumPriority:
        return 'Medium Priority';
      case FilterEnum.lowPriority:
        return 'Low Priority';
    }
  }

}





// DropdownMenuItem(
// value: 1,
// child: Text(
// 'All Todos',
// overflow: TextOverflow.ellipsis,
// maxLines: 2,
// style: TextStyle(
// height: 0,
// letterSpacing: 1.5,
// fontSize: 14,
// fontWeight: FontWeight.w800),
// ),
// ),
// DropdownMenuItem(
// value: 2,
// child: Text('Only Completed'),
// ),
// DropdownMenuItem(
// value: 3,
// child: Text('Not Completed'),
// ),
// DropdownMenuItem(
// value: 4,
// child: Text('High Priority'),
// ),
// DropdownMenuItem(
// value: 5,
// child: Text('Medium Priority'),
// ),
// DropdownMenuItem(
// value: 6,
// child: Text('Low Priority'),
// ),