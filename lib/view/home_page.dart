import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../api_helper/apihelper.dart';
import '../providers/joke_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Map<String, dynamic> theJokes = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetJokes();
  }

  GetJokes() async {
    final data = await ApiHelper.fetchJokes();
    setState(() {
      theJokes = data;
    });
  }

  Widget build(BuildContext context) {
    final jokesProvider = Provider.of<JokesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Jokes"),
      ),
      drawer: Drawer(
        elevation: 5,
        width: 150,
        child: Center(
          child: GlassContainer.clearGlass(
            color: Colors.red,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.star_circle,
                  color: Colors.yellow,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See Favourites",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: MediaQuery.sizeOf(context).width,
              child: Lottie.asset(
                "assets/animations/bganim1.json",
                width: MediaQuery.sizeOf(context).width,
                height: double.infinity,
              )),
          Center(
              child: GlassContainer.clearGlass(
            height: 200,
            width: 300,
            color: Colors.transparent,
            elevation: 6,
            borderRadius: BorderRadius.circular(15),
            child: const Center(child: Text(theJokes.values as String)),
          ))
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          color: Colors.blue,
          semanticContainer: true,
          child: Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width - 20,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15 - 3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(CupertinoIcons.star),
                InkWell(
                    onTap: () async {
                      await Share.share("text", subject: "See this Joke!");
                    },
                    child: const Icon(Icons.share)),
                InkWell(
                    onTap: () {
                      jokesProvider.fetchJokes();
                    },
                    child: const Icon(Icons.refresh))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
