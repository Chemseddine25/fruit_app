import 'package:fruit_app/core/entities/reviews_entity.dart';

class ReviewsModel {
  final String userName;
  final String userImg;
  final num ratting;
  final String date;
  final String reviewDescription;

  ReviewsModel({
    required this.userName,
    required this.userImg,
    required this.ratting,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewsModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewsModel(
      userName: reviewEntity.userName,
      userImg: reviewEntity.userImg,
      ratting: reviewEntity.ratting,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      userName: json['user_name'],
      userImg: json['user_img'],
      ratting: json['ratting'],
      date: json['date'],
      reviewDescription: json['review_description'],
    );
  }

  ReviewEntity toEntity() => ReviewEntity(
        userName: userName,
        userImg: userImg,
        ratting: ratting,
        date: date,
        reviewDescription: reviewDescription,
      );

  toJson() => {
        'user_name': userName,
        'user_img': userImg,
        'ratting': ratting,
        'date': date,
        'review_description': reviewDescription,
      };
}
