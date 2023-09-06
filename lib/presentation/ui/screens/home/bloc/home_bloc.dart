import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:meta/meta.dart';
import 'package:starter/data/events/total_boxes_event.dart';
import 'package:starter/data/mixins/event_mixin.dart';
import 'package:starter/data/network/responses/quote.response.dart';
import 'package:starter/data/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

///
class HomeBloc extends Bloc<HomeEvent, HomeState> with EventMixin<AppEvent> {
  ///
  HomeRepository repository;

  ///
  StreamSubscription<AppEvent>? streamSubscription;

  ///
  HomeBloc(this.repository) : super(const HomeLoadingState()) {
    on<InitialEvent>(_handleInitialEvent);
    on<RefreshEvent>(_handleRefreshEvent);
    on<UpdateBoxesCountEvent>(_handleBoxesCountEvent);
    streamSubscription = listenEvents((AppEvent event) {
      if (event is TotalBoxesEvent) {
        add(UpdateBoxesCountEvent(
            greenBoxCount: event.greenBoxesCount,
            redBoxCount: event.redBoxesCount));
      }
    });
  }

  void _handleBoxesCountEvent(
      UpdateBoxesCountEvent event, Emitter<HomeState> emit) {
    emit(HomeBoxesState(
        'GreenBox => ${event.greenBoxCount}  & RedBox => ${event.redBoxCount}'));
  }

  ///
  void _handleInitialEvent(
      InitialEvent event, Emitter<HomeState> emitter) async {
    await callQuotesApi(emitter);
  }

  ///
  void _handleRefreshEvent(
      RefreshEvent event, Emitter<HomeState> emitter) async {
    await callQuotesApi(emitter);
  }

  ///
  Future<void> callQuotesApi(Emitter<HomeState> emitter) async {
    emitter(const HomeLoadingState());
    try {
      QuoteResponse response = await repository.getQuote();
      emitter(HomeSuccessState(response));
    } catch (e) {
      emitter(HomeErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
