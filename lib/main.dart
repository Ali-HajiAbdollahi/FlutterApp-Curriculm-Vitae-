import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
        dividerColor: surfaceColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyText2: TextStyle(fontSize: 15),
          bodyText1: TextStyle(
              fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
          headline6: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculm Vitae'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  isActive: true),
              Skill(
                  title: 'Adobe XD',
                  imagePath: 'assets/images/app_icon_05.png',
                  shadowColor: Colors.pink,
                  isActive: false),
              Skill(
                  title: 'Illastrator',
                  imagePath: 'assets/images/app_icon_04.png',
                  shadowColor: Colors.orange.shade100,
                  isActive: false),
              Skill(
                  title: 'After Effect',
                  imagePath: 'assets/images/app_icon_03.png',
                  shadowColor: Colors.blue.shade800,
                  isActive: false),
              Skill(
                  title: 'Lightroom',
                  imagePath: 'assets/images/app_icon_02.png',
                  shadowColor: Colors.blue,
                  isActive: false),
            ],
          ),
        )
      ]),
    );
  }
}

class Skill extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: isActive
          ? BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(12))
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}
