import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher for opening URLs

// Placeholder screens for the navigation (you can later replace them)
class VrViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VR View')),
      body: Center(child: Text('Hi, this is VR View!')),
    );
  }
}

class ThreeDViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3D View')),
      body: Center(child: Text('Hi, this is 3D View!')),
    );
  }
}

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are you willing to redirect to Unity APK?'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to redirect to Unity APK (this is just a placeholder)
                print("Redirecting to Unity APK...");
              },
              child: Text('Click here to redirect to Unity APK'),
            ),
          ],
        ),
      ),
    );
  }
}

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // Method to launch GitHub link
  Future<void> _launchGitHub() async {
    const url = 'https://github.com/CodeBreaker0404/Aventus-3.0'; // GitHub link
    if (await canLaunch(url)) {
      await launch(url); // Open GitHub link
    } else {
      throw 'Could not launch $url'; // Handle error if URL can't be opened
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Custom height for the AppBar
        child: AppBar(
          backgroundColor: Colors.cyan, // Aqua marine background
          title: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900], // Navy blue text color
            ),
            duration: Duration(seconds: 1),
            child: Text('VR LUX'),
          ),
          actions: [
            // Hamburger menu as a Drawer icon
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ), // Black hamburger icon
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Open the Drawer
                  },
                );
              },
            ),
          ],
        ),
      ),
      // Main content area
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 120), // Adjusted space for the nav bar
            // Description
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Revolutionizing visualization through VR', // Updated text
                  style: TextStyle(
                    fontSize: 16,
                  ), // Font size to prevent overflow
                ),
              ],
            ),
            SizedBox(height: 20),
            // Demo Heart and Demo Brain
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DemoScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red[300],
                    ),
                    child: Center(
                      child: Text(
                        'Demo Heart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DemoScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text(
                        'Demo Brain',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('VR View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VrViewScreen()),
                );
              },
            ),
            ListTile(
              title: Text('3D View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThreeDViewScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Contact Section',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: _launchGitHub, // GitHub link redirection
                child: Text(
                  'GitHub',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: StartScreen()));
