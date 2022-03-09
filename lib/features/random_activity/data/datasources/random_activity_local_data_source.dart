import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_boring_app/core/errors/exeptions.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

abstract class RandomActivityLocalDataSource {
  Future<void> cacheRandomActivity(RandomActivityModel? activityToCache);
  Future<RandomActivityModel>? getLastRandomActivity();
}

const cachedRandomActivity = 'CACHED_RANDOM_ACTIVITY';

class RandomActivityLocalDataSourceImpl implements RandomActivityLocalDataSource {
  RandomActivityLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheRandomActivity(RandomActivityModel? activityToCache) {
    if (activityToCache != null) {
      return sharedPreferences.setString(cachedRandomActivity, json.encode(activityToCache.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<RandomActivityModel>? getLastRandomActivity() {
    final jsonString = sharedPreferences.getString(cachedRandomActivity);
    if (jsonString != null) {
      return Future.value(
        RandomActivityModel.formJson(json.decode(jsonString))
      );
    } else {
      throw CacheException();
    }
  }
}