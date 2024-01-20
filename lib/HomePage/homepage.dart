import 'package:flutter/material.dart';
import 'package:intelliworkz/HomePage/seavices.dart';
import 'getTheme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedTheme = 'White';
  List<String> themeList = [
    'White',
    'Black',
    'Red',
    'Blue',
    'Yellow',
    'Green',
  ];

  TextEditingController searchController = TextEditingController();
  ColorClass colorClass = ColorClass();

  void applyTheme(String theme) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Applying theme..."),
            ],
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 3));
    await colorClass.savecolor(theme);

    Navigator.pop(context);

    setState(() {
      selectedTheme = theme;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelectedTheme();
  }

  void loadSelectedTheme() async {
    String savedTheme = await colorClass.readcolor();
    setState(() {
      selectedTheme = savedTheme;
    });
  }

  
  bool shouldDisplayTheme(String theme) {
    String searchText = searchController.text.toLowerCase();
    String themeLower = theme.toLowerCase();
    if ((themeLower == 'black' &&
            (searchText == 'dark' || searchText == 'black')) ||
        (themeLower == 'white' &&
            (searchText == 'light' || searchText == 'white'))) {
      return true;
    }
    return themeLower.contains(searchText);
  }

  @override
  Widget build(BuildContext context) {
    GetthemeValue getthemeValue = GetthemeValue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Changer',
      theme: getthemeValue.getThemeData(selectedTheme),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rilpa's Test"),
          elevation: 4,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Adjust the radius as needed
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Theme',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
                child: searchController.text.isNotEmpty
                    ? ListView.builder(
                        itemCount: themeList.length,
                        itemBuilder: (context, index) {
                          if (!shouldDisplayTheme(themeList[index])) {
                            return Container();
                          }
                          return Card(
                            child: ListTile(
                              title: Text(themeList[index]),
                              trailing: ElevatedButton(
                                  child:  Text("Apply"),
                                  onPressed: () {
                                    applyTheme(themeList[index]);
                                    searchController.text = "";
                                  }),
                            ),
                          );
                        },
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}
