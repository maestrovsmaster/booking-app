import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/models/app_token.dart';
import 'package:frontend/data/models/app_user.dart';

class TokenCubit extends Cubit<AppToken?> {
  TokenCubit() : super(null);

  void setToken(AppToken user) {
    emit(user);
  }

  void clearToken() {
    emit(null);
  }
}
