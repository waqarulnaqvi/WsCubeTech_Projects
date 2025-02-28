class FollowChannelInfo {
  final String image;
  final String name;
  final String blueTick;
  final String description;

  FollowChannelInfo(
    this.blueTick, {
    required this.image,
    required this.name,
    required this.description,
  });
}

List<FollowChannelInfo> followChannelInfoList = [
  FollowChannelInfo(
      "https://media.istockphoto.com/id/1443278850/vector/blue-check-mark-vector-illustration.jpg?s=612x612&w=0&k=20&c=vHB4Zuzh9thR1yTHmVZgJvUky4ILtwyz_Jp-EQOyEdY=",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-LCmtDCEBl_F814xMCBPoesLf9y79WHLpZQ&s",
      name: "Aaj Tak",
      description: "23.7M followers"),
  FollowChannelInfo(
    "https://media.istockphoto.com/id/1443278850/vector/blue-check-mark-vector-illustration.jpg?s=612x612&w=0&k=20&c=vHB4Zuzh9thR1yTHmVZgJvUky4ILtwyz_Jp-EQOyEdY=",
    image: "https://picsum.photos/id/238/200/200.jpg",
    name: "WhatsApp",
    description: "226M followers",
  ),
  FollowChannelInfo(
    "https://media.istockphoto.com/id/1443278850/vector/blue-check-mark-vector-illustration.jpg?s=612x612&w=0&k=20&c=vHB4Zuzh9thR1yTHmVZgJvUky4ILtwyz_Jp-EQOyEdY=",
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "TV9 Telugu",
    description: "6.6M followers",
  ),
  FollowChannelInfo(
    "https://media.istockphoto.com/id/1443278850/vector/blue-check-mark-vector-illustration.jpg?s=612x612&w=0&k=20&c=vHB4Zuzh9thR1yTHmVZgJvUky4ILtwyz_Jp-EQOyEdY=",
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Royal Challengers Bangalore",
    description: "8.6M followers",
  ),
];
