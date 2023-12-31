
part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {
  final  String pickedFile;

  ChangeAvatarRequest({required this.pickedFile});
}

class OpenImagePicker extends ProfileEvent {}

class ProvideImagePath extends ProfileEvent {
  final String avatarPath;

  ProvideImagePath({required this.avatarPath});
}

class ChangeAvatarSuccess extends ProfileEvent {
  final String avatarPath;

  ChangeAvatarSuccess({required this.avatarPath});
}

class ProfileDescriptionChanged extends ProfileEvent {
  final String description;

  ProfileDescriptionChanged({required this.description});
}

class SaveProfileChanges extends ProfileEvent {}



// part of 'profile_bloc.dart';

// abstract class ProfileEvent {}

// class ChangeAvatarRequest extends ProfileEvent {
//   final ImagePicker imagePicker;

//   ChangeAvatarRequest({required this.imagePicker});
// }

// class OpenImagePicker extends ProfileEvent {}

// class ProvideImagePath extends ProfileEvent {
//   final String avatarPath;

//   ProvideImagePath({required this.avatarPath});
// }

// class ProfileDescriptionChanged extends ProfileEvent {
//   final String description;

//   ProfileDescriptionChanged({required this.description});
// }

// class SaveProfileChanges extends ProfileEvent {}









// part of 'profile_bloc.dart';

// abstract class ProfileEvent{}

// class ChangeAvatarRequest extends ProfileEvent {}

// class openImagePicker extends ProfileEvent{}

// class ProvideImagePath extends ProfileEvent{
//   final String avatarPath;

//   ProvideImagePath({required this.avatarPath});
// }

// class ProfileDescriptionChanged extends ProfileEvent{
//   final String description;

//   ProfileDescriptionChanged({required this.description});
// }


// class SaveProfileChanges extends ProfileEvent {}
