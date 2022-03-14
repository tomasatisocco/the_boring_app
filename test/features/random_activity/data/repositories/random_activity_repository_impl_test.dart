import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_boring_app/core/connection/network_info.dart';
import 'package:the_boring_app/core/errors/exeptions.dart';
import 'package:the_boring_app/core/errors/failures.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_remote_datasource.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';
import 'package:the_boring_app/features/random_activity/data/repositories/random_activity_repository_implementation.dart';
import 'package:the_boring_app/features/random_activity/domain/entities/random_activity.dart';

import 'random_activity_repository_impl_test.mocks.dart';

@GenerateMocks([
  RandomActivityRemoteDataSource,
  RandomActivityLocalDataSource,
  NetworkInfo,
])
void main(){
  late RandomActivityRepositoryImpl repository;
  late MockRandomActivityLocalDataSource mockLocalDataSource;
  late MockRandomActivityRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockRandomActivityLocalDataSource();
    mockRemoteDataSource = MockRandomActivityRemoteDataSource();
    repository = RandomActivityRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const RandomActivityModel testRandomActivityModel = RandomActivityModel(
    activity: "Go to the Gym twice",
    type: 'recreational',
    link: '',
    participants: 1,
    price: 1,
    accessibility: 1,
  );

  const RandomActivity testRandomActivity = testRandomActivityModel;

  group('When Internet is actibe', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('When Internet is active, return a succes random activity fron remote datasource', 
      () async {
        when(mockRemoteDataSource.getRandomActivity()).thenAnswer((_) async => testRandomActivityModel);

        final result = await repository.getRandomActivity();

        expect(result, equals(const Right(testRandomActivity)));
    });

    test(
      'When Internet is active, return a server exception from remote datasource',
      () async {
        when(mockRemoteDataSource.getRandomActivity()).thenThrow(ServerException());

        Either<Failure, RandomActivity?> result = await repository.getRandomActivity();

        expect(
          result,
          equals(const Left(ServerFailure(errorMessage: 'This is a server exception'))),
        );
      });
  });

  group('When Internet is not active', (){
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'When Internet Not active, return a random activity from datasource',
      () async {
        when(mockLocalDataSource.getLastRandomActivity()).thenAnswer((_) async => testRandomActivityModel);

        final result = await repository.getRandomActivity();

        expect(result, equals(
          const Right(testRandomActivity)
        ));
      }
    );

    test(
      'When Internet is Not active, Throw cache exception from local datasource',
      () async {
        when(mockLocalDataSource.getLastRandomActivity()).thenThrow(CacheException());

        final result = await repository.getRandomActivity();

        expect(result, const Left(CacheFailure(errorMessage: 'This is a cache failure')));
      }
    );
  });
}