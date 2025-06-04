import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDNSApp());
}

class CustomDNSApp extends StatefulWidget {
  const CustomDNSApp({Key? key}) : super(key: key);

  @override
  State<CustomDNSApp> createState() => _CustomDNSAppState();
}

class _CustomDNSAppState extends State<CustomDNSApp> {
  final TextEditingController _controller = TextEditingController(text: 'dns.adguard-dns.com');
  String? _connectedDNS;

  void _connect() {
    setState(() {
      _connectedDNS = _controller.text.trim();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Connected to \$_connectedDNS')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom DNS',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(primary: Colors.blueAccent),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(primary: Colors.blueAccent),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom DNS'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Simple DNS shield icon with text 'DNS'
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.withOpacity(0.2),
                ),
                child: const Text(
                  'DNS',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.blueAccent,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Custom Private DNS Hostname',
                  hintText: 'Enter DNS hostname',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _connect,
                child: const Text('Connect'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 20),
              if (_connectedDNS != null)
                Text(
                  'Connected to \$_connectedDNS',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }
}