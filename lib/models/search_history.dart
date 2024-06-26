class SearchHistory {
  final List<String> history;

  SearchHistory(this.history);

  SearchHistory copyWith({List<String>? history}) {
    return SearchHistory(history ?? this.history);
  }

  Map<String, dynamic> toJson() => {
        'history': history,
      };

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      List<String>.from(json['history']),
    );
  }
}
