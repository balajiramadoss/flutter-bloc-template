import 'package:equatable/equatable.dart';
import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/data/events/total_boxes_event.dart';
import 'package:starter/data/mixins/event_mixin.dart';
import 'package:starter/data/models/example.model.dart';

/// This example don't need repository
///
part 'example_event.dart';
part 'example_state.dart';

///
class ExampleBloc extends Bloc<ExampleEvent, ExampleState>
    with EventMixin<AppEvent> {
  ///
  ExampleBloc() : super(ExampleState.initial());

  ///
  void registerEvents() {
    on<RedBoxClickEvent>(_onHandleRedBoxClickEvent);
    on<GreenBoxClickEvent>(_onHandleGreenBoxClickEvent);
    on<DataPassEvent>(_onDataPassEvent);
  }

  @override
  void onTransition(Transition<ExampleEvent, ExampleState> transition) {
    super.onTransition(transition);
    debugPrint(
        'Event ==> ${transition.event}  State ==> ${transition.currentState}');
  }

  ///
  void _onHandleRedBoxClickEvent(
      RedBoxClickEvent event, Emitter<ExampleState> emit) {
    List<RedBox>? redItems = <RedBox>[...?state.redBoxes];
    redItems[event.index] = redItems[event.index]
        .copyWith(isSelected: !redItems[event.index].isSelected);
    emit(state.copyWith(rBoxes: redItems));
  }

  ///
  void _onHandleGreenBoxClickEvent(
      GreenBoxClickEvent event, Emitter<ExampleState> emit) {
    List<GreenBox>? greenItems = <GreenBox>[...?state.greenBoxes];
    greenItems[event.index] = greenItems[event.index]
        .copyWith(isSelected: !greenItems[event.index].isSelected);
    emit(state.copyWith(gBoxes: greenItems));
  }

  void _onDataPassEvent(DataPassEvent event, Emitter<ExampleState> emit) {
    fireEvent(TotalBoxesEvent(
      greenBoxesCount: state.greenBoxes
              ?.where((GreenBox element) => element.isSelected)
              .length ??
          0,
      redBoxesCount: state.redBoxes
              ?.where((RedBox element) => element.isSelected)
              .length ??
          0,
    ));
  }
}
