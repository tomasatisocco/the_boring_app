import 'package:dartz/dartz.dart';
import 'package:the_boring_app/core/connection/network_info.dart';
import 'package:the_boring_app/core/errors/exeptions.dart';
import 'package:the_boring_app/core/errors/failures.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_remote_datasource.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';
import 'package:the_boring_app/features/random_activity/domain/repositories/random_activity_repository.dart';

class RandomActivityRepositoryImpl implements RandomActivityRepository {
  RandomActivityRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final RandomActivityRemoteDataSource remoteDataSource;
  final RandomActivityLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, RandomActivityModel?>> getRandomActivity() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteActivity = await remoteDataSource.getRandomActivity();
        localDataSource.cacheRandomActivity(remoteActivity);
        return Right(remoteActivity);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        final localActivity = await localDataSource.getLastRandomActivity();
        return Right(localActivity);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache failure'));
      }
    }
  }
}