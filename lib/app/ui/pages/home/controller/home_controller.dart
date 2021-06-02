import 'package:flutter_meedu/meedu.dart';
import 'package:meedu_example/app/domain/repositories/users_repository.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initialState) {
    _init();
  }

  final _usersRepository = Get.i.find<UsersRepository>();

  Future<void> _init() async {
    _load(state.page);
  }

  Future<void> onRefresh() {
    state = HomeState.initialState;
    return _load(1);
  }

  Future<void> _load(int page) async {
    final response = await _usersRepository.getUsersPerPage(page);

    if (response != null) {
      state = state.copyWith(
        loading: false,
        page: page,
        pages: response.totalPages,
        users: [
          ...state.users,
          ...response.data,
        ],
      );
    } else {
      state = state.copyWith(
        loading: false,
      );
    }
  }
}
