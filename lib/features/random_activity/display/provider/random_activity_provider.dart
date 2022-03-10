import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_boring_app/core/connection/network_info.dart';
import 'package:the_boring_app/core/errors/failures.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_remote_datasource.dart';
import 'package:the_boring_app/features/random_activity/data/repositories/random_activity_repository_implementation.dart';
import 'package:the_boring_app/features/random_activity/domain/entities/random_activity.dart';

class RandomActivityProvider extends ChangeNotifier {
  RandomActivityProvider({
    this.randomActivity,
    this.failure,
  });

  RandomActivity? randomActivity;
  Failure? failure; 

  eitherFailureOrActivity() async {
    RandomActivityRepositoryImpl repository = RandomActivityRepositoryImpl(
      remoteDataSource: RandomActivityRemoteDataSourceImpl(dio: Dio()),
      localDataSource: RandomActivityLocalDataSourceImpl(sharedPreferences: await SharedPreferences.getInstance()),
      networkInfo: NetwotkInfoImpl(DataConnectionChecker()),
    );
    final failureOrActivity = await repository.getRandomActivity();
    failureOrActivity.fold(
      (newFailure) {
        randomActivity = null;
        failure = newFailure;
        notifyListeners();
      },
      (activity) {
        randomActivity = activity;
        failure = null;
        notifyListeners();
      },
    );
  }
}