import 'package:flutter/material.dart';

void main() => runApp(const PetApp());

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Pet',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const PetHome(),
    );
  }
}

class PetHome extends StatefulWidget {
  const PetHome({super.key});

  @override
  State<PetHome> createState() => _PetHomeState();
}

class _PetHomeState extends State<PetHome> {
  int hunger = 50;
  int energy = 50;
  int happiness = 50;
  String status = "hi! i'm your lil buddy :3";

  void _clampAll() {
    hunger = hunger.clamp(0, 100);
    energy = energy.clamp(0, 100);
    happiness = happiness.clamp(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Digital Pet"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.restaurant), text: "Feed"),
              Tab(icon: Icon(Icons.sports_esports), text: "Play"),
              Tab(icon: Icon(Icons.bedtime), text: "Sleep"),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            const Text("（｡•̀ᴗ-）✧", style: TextStyle(fontSize: 56)),
            const SizedBox(height: 8),
            Text(status),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: hunger / 100),
            Text("Hunger: $hunger"),
            LinearProgressIndicator(value: energy / 100),
            Text("Energy: $energy"),
            LinearProgressIndicator(value: happiness / 100),
            Text("Happiness: $happiness"),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hunger -= 20;
                          happiness += 5;
                          _clampAll();
                          status = "yum yum!";
                        });
                      },
                      child: const Text("Feed"),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          happiness += 15;
                          energy -= 10;
                          hunger += 5;
                          _clampAll();
                          status = "weeee! that was fun!";
                        });
                      },
                      child: const Text("Play"),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          energy += 25;
                          hunger += 10;
                          _clampAll();
                          status = "zzz… nap time!";
                        });
                      },
                      child: const Text("Sleep"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
