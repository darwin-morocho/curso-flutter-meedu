import 'package:equatable/equatable.dart';
import 'package:meedu_example/app/domain/entities/user.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<User> users;
  final int pages;
  final int page;

  HomeState({
    required this.loading,
    required this.users,
    required this.pages,
    required this.page,
  });

  HomeState copyWith({
    bool? loading,
    List<User>? users,
    int? pages,
    int? page,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      users: users ?? this.users,
      pages: pages ?? this.pages,
      page: page ?? this.page,
    );
  }

  static HomeState get initialState => HomeState(
        loading: true,
        users: [],
        pages: -1,
        page: 1,
      );

  @override
  List<Object?> get props => [loading, users, pages, page];
}
