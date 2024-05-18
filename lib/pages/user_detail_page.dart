import 'package:flutter/material.dart';
import 'package:tugas_mandiri/models/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 27, 33, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.avatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.video_call, size: 30, color: Colors.white),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.call, size: 24, color: Colors.white),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.more_vert,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 33, 39),
        child: Stack(
          children: [
            ListView(
              children: const [
                SizedBox(
                  height: 40,
                  width: 10,
                )
                // Add more messages here
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(left: 8),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.78,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 90, 93, 98),
                    borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.emoji_emotions, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.attach_file, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 122, 8),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    )))
          ],
        ),
      ),
    );
  }
}
