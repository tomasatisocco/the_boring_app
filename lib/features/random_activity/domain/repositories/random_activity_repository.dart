import 'package:dartz/dartz.dart';
import 'package:the_boring_app/core/errors/failures.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

import '../entities/random_activity.dart';

abstract class RandomActivityRepository {
  Future<Either<Failure, RandomActivity?>> getRandomActivity();
}