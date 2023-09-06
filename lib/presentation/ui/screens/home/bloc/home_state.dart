part of 'home_bloc.dart';

///
@immutable
sealed class HomeState with EquatableMixin {
  ///
  const HomeState();
}

///
class HomeLoadingState extends HomeState {
  ///
  const HomeLoadingState();

  @override
  List<Object?> get props => <Object?>[];
}

///
class HomeSuccessState extends HomeState {
  ///
  final QuoteResponse data;

  ///
  const HomeSuccessState(this.data);

  @override
  List<Object?> get props => <Object?>[data];
}

///
class HomeErrorState extends HomeState {
  ///
  final String errorData;

  ///
  const HomeErrorState(this.errorData);

  @override
  List<Object?> get props => <Object?>[errorData];
}

///
class HomeBoxesState extends HomeState {
  ///
  final String data;

  ///
  const HomeBoxesState(this.data);

  @override
  List<Object?> get props => <Object?>[data];
}
