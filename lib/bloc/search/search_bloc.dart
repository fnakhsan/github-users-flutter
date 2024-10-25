import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/network/model/search_response.dart';
import '../../data/repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc({required this.repository}) : super(const SearchState.loading()) {
    on<SearchEvent>((event, emit) async {
      try {
        SearchResponse listUser = await repository.searchUser(event.query);
        emit(SearchState.success(listUser));
      } catch (e) {
        log(e.toString());
        emit(const SearchState.failure());
      }
    });
  }
}
