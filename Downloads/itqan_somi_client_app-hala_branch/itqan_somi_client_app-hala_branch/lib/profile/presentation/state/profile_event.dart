part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class AboutUs extends ProfileEvent {


  @override
  List<Object?> get props => [];
}

class OurVision extends ProfileEvent {


  @override
  List<Object?> get props => [];
}

class OurMessage extends ProfileEvent {


  @override
  List<Object?> get props => [];
}

class Privacy extends ProfileEvent {


  @override
  List<Object?> get props => [];
}
class AllAddressesEvent extends ProfileEvent {


  @override
  List<Object?> get props => [];
}

class ChangePasswordProfile extends ProfileEvent {
  ChangePasswordProfileParams changePasswordProfileParams;

  ChangePasswordProfile({required this.changePasswordProfileParams});

  @override
  List<Object?> get props => [changePasswordProfileParams];
}
class EditProfile extends ProfileEvent {
  ProfileSettingParams profileSettingParams;

  EditProfile({required this.profileSettingParams});

  @override
  List<Object?> get props => [profileSettingParams];
}