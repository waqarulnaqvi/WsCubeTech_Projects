class ChatInfo {
  final String image;
  final String name;
  final String description;
  final String time;
  final String? message;

  ChatInfo({
    required this.image,
    required this.name,
    required this.description,
    required this.time,
    this.message
  });
}

List<ChatInfo> chatInfoList = [
  // Using .jpg images from Picsum for the first 10 entries
  ChatInfo(
    image: "https://picsum.photos/id/237/200/200.jpg",
    name: "Alice",
    description: "Hey, are you free for a call? I have a very great news to tell you ??",
    time: "10:30 AM",
    message: "11"
  ),
  ChatInfo(
    image: "https://picsum.photos/id/238/200/200.jpg",
    name: "Bob",
    description: "Don't forget the meeting at noon.",
    time: "9:15 AM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Charlie",
    description: "Let's catch up soon! 🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣",
    time: "Yesterday",
    message: "4"
  ),
  ChatInfo(
    image: "https://picsum.photos/id/240/200/200.jpg",
    name: "Diana",
    description: "Check out this cool photo 😉 ! do you know how ot drive a bike?",
    time: "11:45 AM",
    message: "12"
  ),
  ChatInfo(
    image: "https://picsum.photos/id/241/200/200.jpg",
    name: "Eve",
    description: "Can you send me the report?",
    time: "12:00 PM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/242/200/200.jpg",
    name: "Cristine",
    description: "Are you coming to the party? 🫶❤️❤️❤️❤️❤️❤️❤️❤️❤️",
    time: "2:30 PM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/243/200/200.jpg",
    name: "Grace",
    description: "I found something interesting!",
    time: "3:00 PM",
      message: "8"

  ),
  ChatInfo(
    image: "https://picsum.photos/id/244/200/200.jpg",
    name: "Hank",
    description: "Let's meet up later.",
    time: "4:15 PM",
  ),
  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=1", // JPG format
    name: "Jack",
    description: "I'll be there in 10 minutes.",
    time: "5:30 PM",
    message: "12"
  ),

  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=3",
    name: "Leo",
    description: "Let's schedule a meeting.",
    time: "9:00 AM",
  ),

  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=5",
    name: "Nick",
    description: "Please review the attached file.",
    time: "10:15 AM",
      message: "5"

  ),

  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=7",
    name: "Paul",
    description: "Meeting has been postponed.",
    time: "12:30 PM",
  ),

  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=9",
    name: "Rachel",
    description: "Check out this link!",
    time: "3:30 PM",
      message: "12"

  ),

  ChatInfo(
    image: "https://picsum.photos/200/200.jpg?random=11",
    name: "Tina",
    description: "Talk to you soon.",
    time: "5:15 PM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/240/200/200.jpg",
    name: "Sam",
    description: "Where are you?",
    time: "4:45 PM",
      message: "12"

  ),
  ChatInfo(
    image: "https://picsum.photos/id/241/200/200.jpg",
    name: "Quinn",
    description: "Let's catch up over coffee.",
    time: "2:00 PM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Olivia",
    description: "I'll call you back later.",
    time: "11:00 AM",
      message: "12"

  ),
  ChatInfo(
    image: "https://picsum.photos/id/238/200/200.jpg",
    name: "Mona",
    description: "Here's the document you requested.",
    time: "8:45 AM",
  ),
  ChatInfo(
    image: "https://picsum.photos/id/237/200/200.jpg",
    name: "Ivy",
    description: "Don't forget to call me.",
    time: "5:00 PM",
      message: "12"

  ),
  ChatInfo(
    image: "https://picsum.photos/id/242/200/200.jpg",
    name: "Karen",
    description: "Had a great time yesterday.",
    time: "Yesterday",
  ),
];
