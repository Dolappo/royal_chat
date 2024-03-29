
import 'package:royal_chat/core/service/chat_service.dart';
import 'package:royal_chat/core/service/firestore_service.dart';
import 'package:royal_chat/core/service/image_picker.dart';
import 'package:royal_chat/ui/Screens/Login_screen.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_screen.dart';
import 'package:royal_chat/ui/Screens/chat_feature/preview_image_screen.dart';
import 'package:royal_chat/ui/Screens/sign_up_screen.dart';
import 'package:royal_chat/ui/Screens/signlog_screen.dart';
import 'package:royal_chat/ui/Screens/welcome_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/service/auth_service.dart';
import '../core/service/firebase_storage_service.dart';
import '../core/service/local_storage.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: WelcomeScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: ChatScreen),
    MaterialRoute(page: DecisionScreen),
    MaterialRoute(page: PreviewSelectedImage),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: FireStorageService),
    LazySingleton(classType: LocalStorage),
    LazySingleton(classType: ImagePickerService),
    LazySingleton(classType: ChatService),
   ],
  logger: StackedLogger(),
)
class $AppSetup {}
