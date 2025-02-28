class StatusInfo {
  final String image;
  final String circularImage;
  final String name;

  StatusInfo({
    required this.circularImage,
    required this.image,
    required this.name,
  });
}

List<StatusInfo> statusInfoList = [
  // Using .jpg images from Picsum for the first 10 entries
  StatusInfo(
    image: "https://picsum.photos/id/237/200/200.jpg",
    name: "Alice", circularImage: 'https://picsum.photos/id/238/200/200.jpg',
  ),
  StatusInfo(
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Bob",
 circularImage: 'https://picsum.photos/id/240/200/200.jpg',
  ),
  StatusInfo(
    image: "https://picsum.photos/id/241/200/200.jpg",
    name: "Eve", circularImage: 'https://picsum.photos/id/242/200/200.jpg',

  ),
  StatusInfo(
    image: "https://picsum.photos/id/243/200/200.jpg",
    name: "Grace",
    circularImage: 'https://picsum.photos/id/244/200/200.jpg',
  ),
  StatusInfo(
    image: "https://picsum.photos/200/200.jpg?random=1", // JPG format
    name: "Jack",
   circularImage: 'https://picsum.photos/200/200.jpg?random=3',
  ),


  StatusInfo(
    image: "https://picsum.photos/200/200.jpg?random=5",
    name: "Nick", circularImage: 'https://picsum.photos/200/200.jpg?random=7',

  ),

  StatusInfo(
    image: "https://picsum.photos/200/200.jpg?random=9",
    name: "Rachel",
   circularImage: 'https://picsum.photos/200/200.jpg?random=11',
  ),

  StatusInfo(
    image: "https://picsum.photos/id/240/200/200.jpg",
    name: "Sam", circularImage: 'https://picsum.photos/id/241/200/200.jpg',
  ),
  StatusInfo(
    image: "https://picsum.photos/id/239/200/200.jpg",
    name: "Olivia", circularImage: 'https://picsum.photos/id/238/200/200.jpg',
  ),
  StatusInfo(
    image: "https://picsum.photos/id/237/200/200.jpg",
    name: "Ivy",
   circularImage: 'https://picsum.photos/id/242/200/200.jpg',
  ),
];
