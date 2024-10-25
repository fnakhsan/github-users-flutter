part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  final String query;
  const SearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}