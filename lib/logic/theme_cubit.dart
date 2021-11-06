import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(true);

  toggleTheme({required bool value}) {
    emit(value);
  }

  @override
  Map<String, dynamic> toJson(bool state) {
    return {'isDark': state};
  }

  @override
  bool fromJson(Map<String, dynamic> json) {
    return json['isDark'];
  }
}
