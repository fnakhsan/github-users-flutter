part of 'search_bloc.dart';

enum SearchStatus { success, loading, failure, }

class SearchState extends Equatable {
  final SearchStatus status;
  final SearchResponse? user;

  const SearchState._({
    this.status = SearchStatus.loading,
    this.user,
  });

  const SearchState.loading() : this._();

  const SearchState.success(SearchResponse user) : this._(status: SearchStatus.success, user: user);

  const SearchState.failure() : this._(status: SearchStatus.failure);

  @override
  List<Object?> get props => [status, user];
}
