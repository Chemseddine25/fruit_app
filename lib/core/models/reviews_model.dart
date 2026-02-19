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

  factory ReviewsModel.fromJson(Map<String, dynamic> Json) {
    return ReviewsModel(
      userName: Json['userName'],
      userImg: Json['userImg'],
      ratting: Json['ratting'],
      date: Json['date'],
      reviewDescription: Json['reviewDescription'],
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
        'userName': userName,
        'userImg': userImg,
        'ratting': ratting,
        'date': date,
        'reviewDescription': reviewDescription,
      };
}
