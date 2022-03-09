import 'package:dartz/dartz.dart';
import 'package:the_boring_app/core/errors/failures.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

abstract class RandomActivityRepository {
  Future<Either<Failure, RandomActivityModel?>> getRandomActivity();
}