class CallsInfo {
  final String image;
  final String name;
  final String callsDetails;
  final bool isVideoCall;
  final bool isMissed;

  CallsInfo({
    required this.image,
    required this.name,
    required this.callsDetails,
    this.isVideoCall=false,
    this.isMissed =false,
  });
}

List<CallsInfo> callsInfoList = [
  // Using .jpg images from Picsum for the first 10 entries
  CallsInfo(
      image: "https://picsum.photos/id/237/200/200.jpg",
      name: "Alice (2)", callsDetails: 'Yesterday, 10:30 AM', isVideoCall: true, isMissed: true
  ),
  CallsInfo(
    image: "https://picsum.photos/id/238/200/200.jpg",
    name: "Bob (3)", callsDetails: 'Yesterday, 9:15 AM',
  ),
  CallsInfo(
      image: "https://picsum.photos/id/239/200/200.jpg",
      name: "Charlie", callsDetails: 'February 26, 8:30 AM', isVideoCall: true

  ),
  CallsInfo(
      image: "https://picsum.photos/id/240/200/200.jpg",
      name: "Diana (10)", callsDetails: 'February 24, 8:30 AM', isMissed: true
  ),
  CallsInfo(
    image: "https://picsum.photos/id/241/200/200.jpg",
    name: "Eve", callsDetails: 'February 23, 8:30 AM',
    isMissed: true,isVideoCall: true,
  ),
  CallsInfo(
    image: "https://picsum.photos/id/242/200/200.jpg",
    name: "Cristine", callsDetails: 'February 22, 8:30 AM',
  ),
  CallsInfo(
      image: "https://picsum.photos/id/243/200/200.jpg",
      name: "Grace (2)",
      callsDetails: 'February 21, 8:30 AM',

  ),
  CallsInfo(
    image: "https://picsum.photos/id/244/200/200.jpg",
    name: "Hank (15)",
    callsDetails: 'February 20, 8:30 AM',isMissed: true,
  ),
];
