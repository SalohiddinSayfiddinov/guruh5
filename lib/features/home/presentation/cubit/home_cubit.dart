import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(count: 0, isDark: false));

  void increment() => emit(state.copyWith(count: state.count + 1));
  void changeMode() => emit(state.copyWith(isDark: !state.isDark));
}
