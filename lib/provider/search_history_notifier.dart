import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsm_inside_flutter/models/search_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, SearchHistory>((ref) {
  return SearchHistoryNotifier();
});

class SearchHistoryNotifier extends StateNotifier<SearchHistory> {
  SearchHistoryNotifier() : super(SearchHistory([])) {
    _loadSearchHistory();
  }

  void addSearchTerm(String term) {
    final updatedHistory = [...state.history, term];
    state = state.copyWith(history: updatedHistory);
    _saveSearchHistory(updatedHistory);
  }

  void removeSearchTerm(int term) {
    final updatedHistory = List<String>.from(state.history)..removeAt(term);
    state = state.copyWith(history: updatedHistory);
    _saveSearchHistory(updatedHistory);
  }

  void clearSearchHistory() {
    state = state.copyWith(history: []);
    _saveSearchHistory([]);
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString('searchHistory');
    if (historyJson != null) {
      final historyList = SearchHistory.fromJson(
          {'history': List<String>.from(historyJson.split(','))}).history;
      state = state.copyWith(history: historyList);
    }
  }

  Future<void> _saveSearchHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('searchHistory', history.join(','));
  }
}
