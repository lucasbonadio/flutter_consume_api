import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../models/users_model.dart';

part 'users_controller.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  List<UserData> users = [];

  @action
  Future<void> fetchUsers() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    users =
        (response.data as List).map((data) => UserData.fromJson(data)).toList();
  }
}
