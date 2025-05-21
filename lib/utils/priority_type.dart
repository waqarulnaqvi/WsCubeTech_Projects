enum PriorityType {
  low,
  medium,
  high;

  int get intValue {
    switch (this) {
      case PriorityType.low:
        return 0;
      case PriorityType.medium:
        return 1;
      case PriorityType.high:
        return 2;
    }
  }

  String get value{
    switch(this){
      case low:
       return "Low";
      case medium:
        return "Medium";
      case high:
        return "High";
    }
  }

  static int stringToInt(String value) {
    switch (value) {
      case "Low":
        return 0;
      case "Medium":
        return 1;
      case "High":
        return 2;
      default:
        throw ArgumentError("Invalid priority string: $value");
    }
  }

  static String intToString(int value) {
    switch (value) {
      case 0:
        return "Low";
      case 1:
        return "Medium";
      case 2:
        return "High";
      default:
        throw ArgumentError("Invalid priority string: $value");
    }
  }

}
