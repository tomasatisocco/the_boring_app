import 'package:dio/dio.dart';
import 'package:the_boring_app/core/errors/exeptions.dart';

import '../models/random_activity_model.dart';

abstract class RandomActivityRemoteDataSource {
  Future<RandomActivityModel>? getRandomActivity();
}

class RandomActivityRemoteDataSourceImpl implements RandomActivityRemoteDataSource {
  RandomActivityRemoteDataSourceImpl({required this.dio});
  
  final Dio dio;

  @override
  Future<RandomActivityModel>? getRandomActivity() async {
    final response = await dio.get(
      'https://www.boredapi.com/api/activity',
      queryParameters: {
        'api_key': 'if you need',
      },
    );
    if (response.statusCode == 200) {
      return RandomActivityModel.formJson(response.data);
    } else {
      throw ServerException();
    }
  }
}