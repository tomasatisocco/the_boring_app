import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_boring_app/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

import '../../../../testing_data/get_string.dart';
import 'random_activity_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main(){
  late MockSharedPreferences sharedPreferences;
  late RandomActivityLocalDataSourceImpl dataSource;

  setUp((){
    sharedPreferences = MockSharedPreferences();
    dataSource = RandomActivityLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  final RandomActivityModel testRandomActivityModel = RandomActivityModel.formJson(
    json.decode(getString('random_activity.json'))
  );

  test('Return a random activity from Cache shared preferences', () async {
    when(sharedPreferences.getString(any))
    .thenReturn(getString('random_activity.json'));

    final result = await dataSource.getLastRandomActivity();

    verify(sharedPreferences.getString(cachedRandomActivity));
    expect(result, equals(testRandomActivityModel));
  });
}