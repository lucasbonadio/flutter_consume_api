import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/users_controller.store.dart';

class Users extends StatelessWidget {
  final user = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (_) => user.users.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: user.users.length,
                  itemBuilder: (context, index) {
                    final u = user.users[index];
                    return ListTile(
                      title: Text(u.name!),
                      subtitle: Text(u.email!),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => user.fetchUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
