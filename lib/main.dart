import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SplitBillModel>(
      model: SplitBillModel(),
      child: MaterialApp(
        title: 'Daily Helper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.indigo
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('pt', 'BR')
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            try {
              if (supportedLocale.languageCode == locale.languageCode
                  && supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            catch(e) {
              print(e.toString());
              return Locale('en', 'US');
            }
          }
          return supportedLocales.first;
        },
        home: HomeScreen(),
      )
    );
  }
}
