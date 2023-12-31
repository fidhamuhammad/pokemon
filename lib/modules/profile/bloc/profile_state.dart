part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class AvatarChangeInProgress extends ProfileState {}

class AvatarChangeSuccess extends ProfileState {
  final String avatarPath;

  AvatarChangeSuccess({required this.avatarPath});
}

class AvatarChangeFailure extends ProfileState {
  final String error;

  AvatarChangeFailure({required this.error});
}

class ProfileDescriptionUpdate extends ProfileState {
  final String description;

  ProfileDescriptionUpdate({required this.description});
}

class ProfileSaveInProgress extends ProfileState {}

class ProfileSaveSuccess extends ProfileState {}

class ProfileSaveFailure extends ProfileState {
  final String error;

  ProfileSaveFailure({required this.error});
}









 