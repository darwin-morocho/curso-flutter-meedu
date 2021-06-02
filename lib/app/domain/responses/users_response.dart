import 'package:meedu_example/app/domain/entities/user.dart';

class UsersResponse {
  UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: (json['data'] as List).map((e) => User.fromJson(e)).toList(),
      );
}
