import 'package:flutter_test/flutter_test.dart';
import 'package:the_boring_app/features/random_activity/data/models/random_activity_model.dart';

void main() {
  const RandomActivityModel testRandomActivityModel = RandomActivityModel(
    activity: 'Go to the gym',
    type: 'recreational',
    participants: 1,
    price: 1,
    link: '',
    accessibility: 1,
  );

  test('Expect a Json with a good data', () {
    final Map<String, dynamic> expectedMap = {
      'activity': 'Go to the gym',
      'type': 'recreational',
      'participants': 1,
      'price': 1,
      'link': '',
      'key': null,
      'accesibility': 1
    };

    final result = testRandomActivityModel.toJson();

    expect(result, expectedMap);
  });
}
