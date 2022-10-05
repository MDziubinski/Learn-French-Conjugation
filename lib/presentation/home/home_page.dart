import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conjugeo'),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.infinity,
                    child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 8.0,
                            left: 8.0,
                          ),
                          child: Text(
                            'Conjugation',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.infinity,
                    child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 8.0,
                            left: 8.0,
                          ),
                          child: Text(
                            'Daily Task',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.infinity,
                    child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 8.0,
                            left: 8.0,
                          ),
                          child: Text(
                            'Conjugation Learn',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
