// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter/data/models/example.model.dart';
import 'package:starter/presentation/ui/screens/example/bloc/example_bloc.dart';

void main() {
  group('ExampleBloc', () {
    late ExampleBloc exampleBloc;

    setUp(() => exampleBloc = ExampleBloc()..registerEvents());

    blocTest(
      'emits [ExampleInitialState] when RedBoxClickEvent is added',
      build: () => exampleBloc,
      act: (ExampleBloc bloc) => bloc.add(const RedBoxClickEvent(index: 0)),
      expect: () => <ExampleState>[
        ExampleState(
            redBoxes: List<RedBox>.generate(
                20,
                (int index) => index == 0
                    ? const RedBox(isSelected: true)
                    : const RedBox()),
            greenBoxes:
                List<GreenBox>.generate(20, (int index) => const GreenBox()))
      ],
    );
  });
}
