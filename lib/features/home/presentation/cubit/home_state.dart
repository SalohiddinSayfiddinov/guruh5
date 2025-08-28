class HomeState {
  final int count;
  final bool isDark;

  const HomeState({required this.count, required this.isDark});

  HomeState copyWith({int? count, bool? isDark}) {
    return HomeState(count: count ?? this.count, isDark: isDark ?? this.isDark);
  }
}
