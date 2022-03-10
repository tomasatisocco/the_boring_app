import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_boring_app/core/usecases/usecase.dart';
import 'package:the_boring_app/features/random_activity/domain/entities/random_activity.dart';
import 'package:the_boring_app/features/random_activity/domain/repositories/random_activity_repository.dart';
import 'package:the_boring_app/features/random_activity/domain/usecases/get_random_activity.dart';

import 'get_random_activity_test.mocks.dart';

@GenerateMocks([RandomActivityRepository])
void main() {
  late GetRandomActivity usecase;
  late MockRandomActivityRepository mockRandomActivityRepository;

  setUp((){
    mockRandomActivityRepository = MockRandomActivityRepository();
    usecase = GetRandomActivity(mockRandomActivityRepository);
  });

  RandomActivity testRandomActivityModel = const RandomActivity(
    activity: 'Go to the gym',
    type: 'recreational',
    participants: 1,
    price: 1,
    link: '',
    accesibility: 1,
  );

  test('Get random activity test', () async {
    when(mockRandomActivityRepository.getRandomActivity())
    .thenAnswer((_) async => Right(testRandomActivityModel));

    final result = await usecase(NoParams());

    expect(result, Right(testRandomActivityModel));
    verify(mockRandomActivityRepository.getRandomActivity());
    verifyNoMoreInteractions(mockRandomActivityRepository);
    verifyZeroInteractions(mockRandomActivityRepository);
  });
}