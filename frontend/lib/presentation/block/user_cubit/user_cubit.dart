import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/models/app_user.dart';

class UserCubit extends Cubit<AppUser?> {
  UserCubit() : super(null);

  void setUser(AppUser user) {
    emit(user);
  }

  void clearUser() {
    emit(null);
  }
}
