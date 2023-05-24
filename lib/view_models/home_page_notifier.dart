import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/home_page_state.dart';

// 状態の保持、状態の変更を行う
class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(const HomePageState());

  // カウントを増やす
  void increment() async {
    state = state.copyWith(count: state.count + 1);
  }

  // カウントをリセットする
  void reset() async {
    state = state.copyWith(count: 0);
  }
}

// autoDispose()を使うと、Providerが不要になったときに自動的に破棄される
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
