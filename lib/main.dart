import 'package:flutter/material.dart';
import 'package:sendbird/open_channel_page.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';
// import 'package:sendbird_sdk/sendbird_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final apiToken = 'f93b05ff359245af400aa805bafd2a091a173064';
  final apiHost =
      'https://api-BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF.sendbird.com/v3/open_channels';
  // final sendbird = await SendbirdSdk(
  //   appId: 'BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF',
  //   apiToken: apiToken,
  // );
  SendbirdChat.init(appId: 'BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF');
  SendbirdChat.setLogLevel(LogLevel.info);
  final user = await SendbirdChat.connect('Eyuel');
  // sendbird.setLogLevel(LogLevel.verbose);
  // final user = await sendbird.connect(apiHost);
  print({"user": user.toString()});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpenChannelPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Main Page'),
      ),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
