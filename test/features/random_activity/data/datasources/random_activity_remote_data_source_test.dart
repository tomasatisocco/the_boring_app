import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_remote_datasource.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

import '../../../../testing_data/get_string.dart';
import 'random_activity_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RandomActivityRemoteDataSourceImpl dataSource;

  setUp((){
    mockDio = MockDio();
    dataSource = RandomActivityRemoteDataSourceImpl(dio: mockDio);
  });

  final RandomActivityModel testRandomActivityModel = RandomActivityModel.formJson(
    json.decode(getString('random_activity.json'))
  );

  test('Return a random activity when the response code is succes 200', () async {
    when(mockDio.get(
      'https://www.boredapi.com/api/activity',
      queryParameters: {
        'api_key': 'if you need',
      }
    ))
    .thenAnswer((_) async => Response(
      data: json.decode(getString('random_activity.json')),
      requestOptions: RequestOptions(path: 'Random Path'),
      statusCode: 200,
    ));

    final result = await dataSource.getRandomActivity();

    expect(result, equals(testRandomActivityModel));
  });
}