import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://twqyypxlcrvhnqlkmtbr.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR3cXl5cHhsY3J2aG5xbGttdGJyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU0NjgyMjksImV4cCI6MjAxMTA0NDIyOX0.xACd4-yDJTSwOcuBqapN-Zm7kMQo6k5npQSB6owAoXA');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 21, 0),
        title: const Align(alignment: Alignment.center, child: Text('Notes')),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return SimpleDialog(
                  title: const Text('Add Note'),
                  contentPadding: const EdgeInsets.all(20),
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) async {
                        await Supabase.instance.client.from('notes').insert([
                          {'body': value}
                        ]);
                      },
                    )
                  ],
                );
              }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 21, 21, 0),
      ),
    );
  }
}
