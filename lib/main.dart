// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: _themeMode == ThemeMode.dark
          ? MyThemeConfig.dark().myThemeData()
          : MyThemeConfig.light().myThemeData(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark) {
              _themeMode = ThemeMode.light;
            } else {
              _themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class MyThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backGroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyThemeConfig({
    required this.appBarColor,
    required this.surfaceColor,
    required this.backGroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.brightness,
  });

  MyThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backGroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backGroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData myThemeData() {
    return ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primaryColor: Colors.pink.shade400,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor))),
        dividerColor: surfaceColor,
        brightness: brightness,
        scaffoldBackgroundColor: backGroundColor,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyText2: TextStyle(fontSize: 15),
          bodyText1: TextStyle(fontSize: 13, color: primaryTextColor),
          headline6: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillsType? _skill;

  void updateSelectedSkill(_SkillsType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculm Vitae'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: () {
              widget.toggleThemeMode();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ali HajiAbdollahi',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Front-End Developer'),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            size: 14,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Karaj, IRAN',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              'As a computer engineer, I learned Java in university and self-taught React.js. I gained experience as a developer before pursuing courses in deep learning and artificial intelligence.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            ),
          ),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                Skill(
                  title: 'Photoshop',
                  imagePath: 'assets/images/app_icon_01.png',
                  shadowColor: Colors.blue,
                  isActive: _skill == _SkillsType.photoshop,
                  type: _SkillsType.photoshop,
                  onTap: () {
                    updateSelectedSkill(_SkillsType.photoshop);
                  },
                ),
                Skill(
                  title: 'Adobe XD',
                  imagePath: 'assets/images/app_icon_05.png',
                  shadowColor: Colors.pink,
                  isActive: _skill == _SkillsType.xD,
                  type: _SkillsType.xD,
                  onTap: () {
                    updateSelectedSkill(_SkillsType.xD);
                  },
                ),
                Skill(
                  title: 'Illastrator',
                  imagePath: 'assets/images/app_icon_04.png',
                  shadowColor: Colors.orange.shade100,
                  isActive: _skill == _SkillsType.illustrator,
                  type: _SkillsType.illustrator,
                  onTap: () {
                    updateSelectedSkill(_SkillsType.illustrator);
                  },
                ),
                Skill(
                  title: 'After Effect',
                  imagePath: 'assets/images/app_icon_03.png',
                  shadowColor: Colors.blue.shade800,
                  isActive: _skill == _SkillsType.afterEffect,
                  type: _SkillsType.afterEffect,
                  onTap: () {
                    updateSelectedSkill(_SkillsType.afterEffect);
                  },
                ),
                Skill(
                  title: 'Lightroom',
                  imagePath: 'assets/images/app_icon_02.png',
                  shadowColor: Colors.blue,
                  isActive: _skill == _SkillsType.lightRoom,
                  type: _SkillsType.lightRoom,
                  onTap: () {
                    updateSelectedSkill(_SkillsType.lightRoom);
                  },
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email', prefixIcon: Icon(CupertinoIcons.at)),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock)),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(onPressed: () {}, child: Text('Save')),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _SkillsType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;
  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.8),
                          blurRadius: 20,
                        )
                      ],
                    )
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

enum _SkillsType {
  photoshop,
  xD,
  illustrator,
  afterEffect,
  lightRoom,
}
