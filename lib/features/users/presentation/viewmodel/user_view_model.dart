import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpro/features/users/data/model/user_model.dart';
import 'package:testpro/features/users/data/repository/user_service_repository.dart';

final usersProvider =
    AsyncNotifierProvider<UsersNotifier, List<User>>(UsersNotifier.new);

class UsersNotifier extends AsyncNotifier<List<User>> {
  @override
  Future<List<User>> build() async {
    final userService = ref.read(userServiceProvider);
    return await userService.fetchUsers();
  }
}
