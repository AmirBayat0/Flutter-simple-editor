import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Editor',
      home: MainColorPicker(),
    );
  }
}

class MainColorPicker extends StatefulWidget {
  const MainColorPicker({Key? key}) : super(key: key);

  @override
  State<MainColorPicker> createState() => _MainColorPickerState();
}

class _MainColorPickerState extends State<MainColorPicker> {
  bool isDark = true;
  String dropdownValue = 'one';
  int currentIndex = 0;
  Color color = Colors.white;
  double currentSliderValueImg = 0.0;
  double currentSliderValueFont = 20.0;
  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      /// BottomNavigationBar
      appBar: AppBar(
        title: Column(
          children: const [
            Text("Flutter Simple Editor"),
            Text(
              "Code With Flexz",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.grey[800],
      ),

      /// BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            ///
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            ///
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: "Post",
            ),

            ///
            BottomNavigationBarItem(
              icon: Icon(
                Icons.podcasts,
              ),
              label: "My Network",
            ),
          ],
          backgroundColor: Colors.grey[800],
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedFontSize: 15,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          selectedIconTheme: const IconThemeData(size: 26)),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Top Text
            Text(
              "Mountain",
              style: TextStyle(
                color: color,
                fontSize: currentSliderValueFont,
                fontWeight: FontWeight.w400,
              ),
            ),

            /// Middle  Image
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: color),
                  borderRadius: BorderRadius.circular(currentSliderValueImg),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/800px-080103_hakkai_fuji.jpg"))),
            ),

            ///
            const SizedBox(
              height: 60,
            ),

            /// Tow Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Color Picker BTN
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurpleAccent,
                  )),
                  onPressed: () => pickColor(context),
                  child: const Text("Pick a Color"),
                ),

                /// Reset BTN
                CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          color = Colors.white;
                          currentSliderValueImg = 0.0;
                          currentSliderValueFont = 20.0;
                        });
                      },
                      icon: const Icon(
                        Icons.refresh_outlined,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),

            /// Border Radius
            Slider(
              thumbColor: Colors.deepPurpleAccent,
              activeColor: Colors.deepPurpleAccent,
              value: currentSliderValueImg,
              max: 150,
              label: currentSliderValueImg.toString(),
              onChanged: (double value) {
                setState(() {
                  currentSliderValueImg = value;
                });
              },
            ),

            /// FontSize
            Slider(
              thumbColor: Colors.deepPurpleAccent,
              activeColor: Colors.deepPurpleAccent,
              value: currentSliderValueFont,
              max: 60,
              label: currentSliderValueFont.toString(),
              onChanged: (double value) {
                setState(() {
                  currentSliderValueFont = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

// Pick Color Func
  void pickColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Pick Your Color"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColorPicker(
                    pickerColor: color,
                    onColorChanged: (current) {
                      setState(() {
                        color = current;
                      });
                    }),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "SELECT",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
