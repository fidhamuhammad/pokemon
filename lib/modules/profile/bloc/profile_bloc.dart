import 'package:app/modules/profile/repository/auth_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {});
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeAvatarRequest) {
      yield* _mapChangeAvatarRequestToState(event);
    } else if (event is ProvideImagePath) {
      yield AvatarChangeSuccess(avatarPath: event.avatarPath);
    } else if (event is ProfileDescriptionChanged) {
      yield ProfileDescriptionUpdate(description: event.description);
    } else if (event is SaveProfileChanges) {
      yield* _mapSaveProfileChangesToState();
    }
    // Handle other events...
  }

  Stream<ProfileState> _mapChangeAvatarRequestToState(
      ChangeAvatarRequest event) async* {
    try {
      yield AvatarChangeInProgress();
      final avatarPath = await _uploadAvatarToServer(event.pickedFile as PickedFile);

      yield AvatarChangeSuccess(avatarPath: avatarPath);
      // final pickedFile =

      //     await event.pickedFile.pickImage(source: ImageSource.gallery);

      // if (pickedFile != null) {
      //   final pickedFileAsPicked = PickedFile(pickedFile.path);

      //   final avatarPath = await _uploadAvatarToServer(pickedFileAsPicked);

      //   yield AvatarChangeSuccess(avatarPath: avatarPath);
      // }
    } catch (e) {
      yield AvatarChangeFailure(error: 'Failed to change avatar: $e');
    }
  }

  Future<String> _uploadAvatarToServer(PickedFile pickedFile) async {
    // Perform logic to upload the image file to your server
    // Return the path to the uploaded image
    // For example, you might use Dio or http package for this
    return 'path_to_uploaded_avatar';
  }

  Stream<ProfileState> _mapSaveProfileChangesToState() async* {
    try {
      yield ProfileSaveInProgress();

      // Assuming you have a method to get the updated profile data
      final updatedProfileData = getUpdatedProfileData();

      // Perform logic to save profile changes to your server
      // For example, you might use Dio or http package for this
      final response =
          await AuthProfile().saveProfileChanges(updatedProfileData);

      if (response.statusCode == 200) {
        // Profile changes saved successfully
        yield ProfileSaveSuccess();
      } else {
        // Failed to save profile changes
        yield ProfileSaveFailure(error: 'Failed to save profile changes');
      }
    } catch (e) {
      yield ProfileSaveFailure(error: 'Failed to save profile changes: $e');
    }
  }

  // Replace this method with the actual method to get updated profile data
  Map<String, dynamic> getUpdatedProfileData() {
    return {
      'name': 'Updated Name',
      'email': 'updated@example.com',
      'phone number': 'Update phone number',
      'description': 'updated bio'
    };
  }
}















// import 'package:app/modules/profile/repository/auth_profile.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// part 'profile_event.dart';
// part 'profile_state.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc() : super(ProfileInitial()) {
//     on<ProfileEvent>((event, emit) async {
//     // Handle ProfileDescriptionChanged event
//       final description = event.description;
//       // Perform logic based on the description...
//       emit(ProfileDescriptionUpdate(description: description));

//     });
//   }

//   @override
//   Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
//     if (event is ChangeAvatarRequest) {
//       yield* _mapChangeAvatarRequestToState(
//           event); // Pass the event as an argument
//     } else if (event is ProvideImagePath) {
//       yield AvatarChangeSuccess(avatarPath: event.avatarPath);
//     } else if (event is ProfileDescriptionChanged) {
//       yield ProfileDescriptionUpdate(description: event.description);
//     } else if (event is SaveProfileChanges) {
//       yield* _mapSaveProfileChangesToState();
//     }
//     // Handle other events...
//   }

//   Stream<ProfileState> _mapChangeAvatarRequestToState(
//       ChangeAvatarRequest event) async* {
//     try {
//       yield AvatarChangeInProgress();

//       final pickedFile =
//           await event.imagePicker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         // Convert XFile to PickedFile
//         final pickedFileAsPicked = PickedFile(pickedFile.path);

//         // Perform upload to your server and get the avatar path
//         final avatarPath = await _uploadAvatarToServer(pickedFileAsPicked);

//         // Notify the UI with the avatar path
//         yield AvatarChangeSuccess(avatarPath: avatarPath);
//       }
//     } catch (e) {
//       yield AvatarChangeFailure(error: 'Failed to change avatar: $e');
//     }
//   }

//   Future<String> _uploadAvatarToServer(PickedFile pickedFile) async {
//     // Perform logic to upload the image file to your server
//     // Return the path to the uploaded image
//     // For example, you might use Dio or http package for this
//     return 'path_to_uploaded_avatar';
//   }

//   // Stream<ProfileState> _mapSaveProfileChangesToState() async* {
//   //   try {
//   //     yield ProfileSaveInProgress();

//   //     // Perform logic to save profile changes to your server
//   //     // For example, you might use Dio or http package for this

//   //     yield ProfileSaveSuccess();
//   //   } catch (e) {
//   //     yield ProfileSaveFailure(error: 'Failed to save profile changes: $e');
//   //   }
//   // }

//   Stream<ProfileState> _mapSaveProfileChangesToState() async* {
//   try {
//     yield ProfileSaveInProgress();

//     // Assuming you have a method to get the updated profile data
//     final updatedProfileData = getUpdatedProfileData();

//     // Perform logic to save profile changes to your server
//     // For example, you might use Dio or http package for this
//     final response = await AuthProfile().saveProfileChanges(updatedProfileData);

//     if (response.statusCode == 200) {
//       // Profile changes saved successfully
//       yield ProfileSaveSuccess();
//     } else {
//       // Failed to save profile changes
//       yield ProfileSaveFailure(error: 'Failed to save profile changes');
//     }
//   } catch (e) {
//     yield ProfileSaveFailure(error: 'Failed to save profile changes: $e');
//   }
// }

// // Replace this method with the actual method to get updated profile data
// Map<String, dynamic> getUpdatedProfileData() {
//   // Implement this method to get the updated profile data
//   // You might use text controllers or other state management mechanisms
//   return {
//     'name': 'Updated Name',
//     'email': 'updated@example.com',
//     'phone number': 'Update phone number',
//     'description': 'updated bio'
//   };
// }

// }













// import 'package:flutter/material.dart';
// import 'package:social_media_app/auth/form_submission_status.dart';
// import 'package:social_media_app/models/User.dart';

// class ProfileState {
//   final User user;
//   final bool isCurrentUser;
//   final String avatarPath;
//   final String userDescription;

//   String get username => user.username;
//   String get email => user.email;

//   final FormSubmissionStatus formStatus;

//   ProfileState({
//     @required User user,
//     @required bool isCurrentUser,
//     String avatarPath,
//     String userDescription,
//     this.formStatus = const InitialFormStatus(),
//   })  : this.user = user,
//         this.isCurrentUser = isCurrentUser,
//         this.avatarPath = avatarPath,
//         this.userDescription = userDescription ?? user.description;

//   ProfileState copyWith({
//     User user,
//     String avatarPath,
//     String userDescription,
//     FormSubmissionStatus formStatus,
//   }) {
//     return ProfileState(
//       user: user ?? this.user,
//       isCurrentUser: this.isCurrentUser,
//       avatarPath: avatarPath ?? this.avatarPath,
//       userDescription: userDescription ?? this.userDescription,
//       formStatus: formStatus ?? this.formStatus,
//     );
//   }
// }








// import 'package:app/modules/home/home_page_store.dart';
// import 'package:app/modules/profile/bloc/profile_event.dart';
// import 'package:bloc/bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';

// part 'profile_state.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc() : super(ProfileInitial()){
//     on<ProfileEvent>((event, emit){
      
//     });
//   }

//   @override
//   Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
//     if (event is ChangeAvatarRequest) {
//       yield* _mapChangeAvatarRequestToState();
//     } else if (event is OpenImagePicker) {
//       // Implement logic for opening image picker
//     } else if (event is ProvideImagePath) {
//       yield AvatarChangeSuccess(avatarPath: event.avatarPath);
//     } else if (event is ProfileDescriptionChanged) {
//       yield ProfileDescriptionUpdate(description: event.description);
//     } else if (event is SaveProfileChanges) {
//       yield* _mapSaveProfileChangesToState();
//     }
//   }

//  Stream<ProfileState> _mapChangeAvatarRequestToState() async* {
//   try {
//     // Open the file picker to select an image
//     final imagePicker = ImagePicker();
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       // Image picked successfully, you can now update the avatar
//       // You might want to upload the image to a server, save it locally, etc.
//       // For now, let's assume you just want to update the state with the new image path.

//       final newImagePath = pickedFile.path; // Replace this with your logic
//       yield AvatarChangeSuccess(avatarPath: newImagePath);
//     } else {
//       // User canceled the image picking
//       // yield AvatarChangeCanceled();
//     }
//   } catch (e) {
//     yield AvatarChangeFailure(error: 'Error changing avatar: $e');
//   }
// }


//   Stream<ProfileState> _mapSaveProfileChangesToState() async* {
//     try {
//       // Implement logic for saving profile changes
//       yield ProfileSaveInProgress();

//       // Simulate a delay (replace this with your actual save logic)
//       await Future.delayed(Duration(seconds: 2));

//       // Save process succeeded
//       yield ProfileSaveSuccess();
//     } catch (e) {
//       yield ProfileSaveFailure(error: 'Error saving profile: $e');
//     }
//   }
// }
 








// import 'package:app/modules/home/home_page_store.dart';
// import 'package:app/modules/profile/bloc/profile_event.dart';
// import 'package:bloc/bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';

 
// part 'profile_state.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc() : super(ProfileInitial()) {
//     on<ProfileEvent>((event, emit) {
//       // TODO: implement event handler

//     }
// );
// }
//      @override
//   Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
//     if (event is ChangeAvatarRequest) {
//       yield* _mapChangeAvatarRequestToState();
//     } else if (event is OpenImagePicker) {
//       // Implement logic for opening image picker
//     } else if (event is ProvideImagePath) {
//       yield AvatarChangeSuccess(avatarPath: event.avatarPath);
//     } else if (event is ProfileDescriptionChanged) {
//       yield ProfileDescriptionUpdate(description: event.description);
//     } else if (event is SaveProfileChanges) {
//       yield* _mapSaveProfileChangesToState();
//     }
//   }

//    Stream<ProfileState> _mapChangeAvatarRequestToState() async* {
//   try {
//     // Open the file picker to select an image
//     final imagePicker = ImagePicker();
//     final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       // Image picked successfully, you can now update the avatar
//       // You might want to upload the image to a server, save it locally, etc.
//       // For now, let's assume you just want to update the state with the new image path.

//       final newImagePath = pickedFile.path; // Replace this with your logic
//       yield AvatarChangeSuccess(newImagePath: newImagePath);
//     } else {
//       // User canceled the image picking
//       yield AvatarChangeCanceled();
//     }
//   } catch (e) {
//     yield AvatarChangeFailure(error: 'Error changing avatar: $e');
//   }
// }

//   Stream<ProfileState> _mapSaveProfileChangesToState() async* {
//     try {
//       // Implement logic for saving profile changes
//       yield ProfileSaveInProgress();
//       // Save process succeeded
//       yield ProfileSaveSuccess();
//     } catch (e) {
//       yield ProfileSaveFailure(error: 'Error saving profile: $e');
//     }
//   }
// }

