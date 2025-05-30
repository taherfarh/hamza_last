part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final BlocStatus<AboutUsModel> aboutUsStatue;
  final BlocStatus<OurVesionModel> ouVisionStatue;
  final BlocStatus<OurMessageModel> ouMessageStatue;
  final BlocStatus<PrivacyPolicyModel> privacyStatue;
  final BlocStatus<Response> changePasswordProfileStatue;
  final BlocStatus<EditProfileModel> editProfileStatue;
  final BlocStatus<AllAddressesModel> allAddressesStatue;

  const ProfileState({
    this.aboutUsStatue = const BlocStatus(),
    this.ouVisionStatue = const BlocStatus(),
    this.ouMessageStatue = const BlocStatus(),
    this.privacyStatue = const BlocStatus(),
    this.changePasswordProfileStatue = const BlocStatus(),
    this.editProfileStatue = const BlocStatus(),
    this.allAddressesStatue = const BlocStatus(),
  });

  ProfileState copyWith({
    BlocStatus<AboutUsModel>? aboutUsStatue,
    BlocStatus<OurVesionModel>? ouVisionStatue,
    BlocStatus<OurMessageModel>? ouMessageStatue,
    BlocStatus<PrivacyPolicyModel>? privacyStatue,
    BlocStatus<Response>? changePasswordProfileStatue,
    BlocStatus<EditProfileModel>? editProfileStatue,
    BlocStatus<AllAddressesModel>? allAddressesStatue,
  }) {
    return ProfileState(
        aboutUsStatue: aboutUsStatue ?? this.aboutUsStatue,
        ouVisionStatue: ouVisionStatue ?? this.ouVisionStatue,
        ouMessageStatue: ouMessageStatue ?? this.ouMessageStatue,
        privacyStatue: privacyStatue ?? this.privacyStatue,
        changePasswordProfileStatue:
            changePasswordProfileStatue ?? this.changePasswordProfileStatue,
        editProfileStatue: editProfileStatue ?? this.editProfileStatue,
        allAddressesStatue: allAddressesStatue ?? this.allAddressesStatue,
    );
  }

  @override
  List<Object?> get props => [
        aboutUsStatue,
        ouVisionStatue,
        ouMessageStatue,
        privacyStatue,
        changePasswordProfileStatue,
        editProfileStatue,
        allAddressesStatue,
      ];
}
