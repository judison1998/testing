














import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:provider/provider.dart';

import 'src/adaptive_login.dart';
import 'src/adaptive_playlists.dart';
import 'src/app_state.dart';

// From https://developers.google.com/youtube/v3/guides/auth/installed-apps#identify-access-scopes
final scopes = [
  'https://www.googleapis.com/auth/youtube.readonly',
];

// TODO: Replace with your Client ID and Client Secret for Desktop configuration
final clientId = ClientId(
  'TODO-Client-ID.apps.googleusercontent.com',
  'TODO-Client-secret',
);

void main() {
  runApp(ChangeNotifierProvider<AuthedUserPlaylists>(
    create: (context) => AuthedUserPlaylists(),
    child: const PlaylistsApp(),
  ));
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Playlists',
      theme: FlexColorScheme.light(scheme: FlexScheme.red).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.red).toTheme,
      themeMode: ThemeMode.dark, // Or ThemeMode.System if you'd prefer
      debugShowCheckedModeBanner: false,
      home: AdaptiveLogin(
        builder: (context, authClient) {
          context.read<AuthedUserPlaylists>().authClient = authClient;
          return const AdaptivePlayLists();
        },
        clientId: clientId,
        scopes: scopes,
        loginButtonChild: const Text('Login to YouTube'),
      ),
    );
  }
}

























// //you tube api key = AIzaSyBQ0kdFx1y09ijh7qVUOnfjWuttSGGUr9o

// //import 'dart:io';
// import 'package:googleapis_auth/googleapis_auth.dart'; // Add this line
// import 'src/adaptive_login.dart';                     // Add this line
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'src/app_state.dart';
// import 'src/playlists.dart';

// // From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
// //const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';

// // TODO: Replace with your YouTube API Key
// //const youTubeApiKey = 'AIzaSyBQ0kdFx1y09ijh7qVUOnfjWuttSGGUr9o';
// final scopes = [
//   'https://www.googleapis.com/auth/youtube.readonly',
// ];

// // TODO: Replace with your Client ID and Client Secret for Desktop configuration
// final clientId = ClientId(
//   'TODO-Client-ID.apps.googleusercontent.com',
//   'TODO-Client-secret',
// );
// void main() {
//   // if (youTubeApiKey == 'AIzaNotAnApiKey') {
//   //   print('youTubeApiKey has not been configured.');
//   //   exit(1);
//   }

//   runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
//     create: (context) => FlutterDevPlaylists(
//       flutterDevAccountId: flutterDevAccountId,
//       youTubeApiKey: youTubeApiKey,
//     ),
//     child: const PlaylistsApp(),
//   ));
// }

// class PlaylistsApp extends StatelessWidget {
//   const PlaylistsApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'your Playlists',
//       theme: FlexColorScheme.light(scheme: FlexScheme.red).toTheme,
//       darkTheme: FlexColorScheme.dark(scheme: FlexScheme.red).toTheme,
//       themeMode: ThemeMode.dark, // Or ThemeMode.System if you'd prefer
//       debugShowCheckedModeBanner: false,
//       home: AdaptiveLogin(
//         builder: (context, authClient) {
//           context.read<AuthedUserPlaylists>().authClient = authClient;
//           return const AdaptivePlaylists();
//         },
//         clientId: clientId,
//         scopes: scopes,
//         loginButtonChild: const Text('Login to YouTube'),
//       ),
//     );
//   }
// }


































// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ResizeablePage(),
//     );
//   }
// }

// class ResizeablePage extends StatelessWidget {
//   const ResizeablePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final themePlatform = Theme.of(context).platform;

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Window properties',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             const SizedBox(height: 8),
//             SizedBox(
//               width: 350,
//               child: Table(
//                 textBaseline: TextBaseline.alphabetic,
//                 children: <TableRow>[
//                   _fillTableRow(
//                     context: context,
//                     property: 'Window Size',
//                     value: '${mediaQuery.size.width.toStringAsFixed(1)} x '
//                         '${mediaQuery.size.height.toStringAsFixed(1)}',
//                   ),
//                   _fillTableRow(
//                     context: context,
//                     property: 'Device Pixel Ratio',
//                     value: mediaQuery.devicePixelRatio.toStringAsFixed(2),
//                   ),
//                   _fillTableRow(
//                     context: context,
//                     property: 'Platform.isXXX',
//                     value: platformDescription(),
//                   ),
//                   _fillTableRow(
//                     context: context,
//                     property: 'Theme.of(ctx).platform',
//                     value: themePlatform.toString(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   TableRow _fillTableRow(
//       {required BuildContext context,
//       required String property,
//       required String value}) {
//     return TableRow(
//       children: [
//         TableCell(
//           verticalAlignment: TableCellVerticalAlignment.baseline,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(property),
//           ),
//         ),
//         TableCell(
//           verticalAlignment: TableCellVerticalAlignment.baseline,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(value),
//           ),
//         ),
//       ],
//     );
//   }

//   String platformDescription() {
//     if (kIsWeb) {
//       return 'Web';
//     } else if (Platform.isAndroid) {
//       return 'Android';
//     } else if (Platform.isIOS) {
//       return 'iOS';
//     } else if (Platform.isWindows) {
//       return 'Windows';
//     } else if (Platform.isMacOS) {
//       return 'macOS';
//     } else if (Platform.isLinux) {
//       return 'Linux';
//     } else if (Platform.isFuchsia) {
//       return 'Fuchsia';
//     } else {
//       return 'Unknown';
//     }
//   }
// }
