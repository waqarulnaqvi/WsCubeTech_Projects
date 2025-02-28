class ChannelInfo {
  final String image;
  final String name;
  final String description;
  final String? time;
  final String? message;

  ChannelInfo({
    required this.image,
    required this.name,
    required this.description,
    this.time,
    this.message
  });
}

List<ChannelInfo> channelInfoList = [
  // Using .jpg images from Picsum for the first 10 entries
  ChannelInfo(
    image: "https://picsum.photos/id/237/200/200.jpg",
    name: "Fresher Jobs & Internships",
    description: "📌 Hey, are you free for a call? I have a very great news to tell you ??",
    time: "10:30 AM",
    message: "121"
  ),
  ChannelInfo(
    image: "https://picsum.photos/id/238/200/200.jpg",
    name: "Mysterious Coder",
    description: "Don't forget the meeting at noon.",
  ),
  ChannelInfo(
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Charlie",
    description: "Let's catch up soon! 🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣",
    time: "Yesterday",
  ),
];
