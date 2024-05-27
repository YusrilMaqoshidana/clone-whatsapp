import 'package:flutter/material.dart';
import 'package:tugas_mandiri/models/user.dart';
import 'package:tugas_mandiri/pages/user_detail_page.dart';
import 'package:tugas_mandiri/services/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 27, 33, 1),
        title: const Text(
          "Contact Person",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.search, color: Colors.grey),
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 33, 39),
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    color: const Color.fromRGBO(23, 27, 33, 1),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(
                        "${user.firstName} ${user.lastName}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(user.email, style: const TextStyle(color: Colors.white)),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
