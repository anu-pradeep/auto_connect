import 'package:auto_connect/screens/sign_in_with_custom_widgets/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(900, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInScreen(),
        );
      },
    );
  }
}
// import 'package:auto_connect/screens/sign_in_with_custom_widgets/sign_in_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         return ScreenUtilInit(
//           designSize: _getDesignSize(context),
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (_, child) {
//             return const MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: SignInScreen(),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   /// Determines the appropriate design size based on screen width.
//   Size _getDesignSize(BuildContext context) {
//     // Obtain the screen width
//     double screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
//
//     if (screenWidth > 600) {
//       // Tablet Design Size
//       return const Size(900, 1024);
//     } else {
//       // Mobile Design Size
//       return const Size(375, 812); // Typical mobile size
//     }
//   }
// }
