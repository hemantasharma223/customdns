import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const CustomDNSApp(),
  ));
}

class CustomDNSApp extends StatelessWidget {
  const CustomDNSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Custom DNS',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DNSHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DNSHomePage extends StatefulWidget {
  const DNSHomePage({super.key});

  @override
  State<DNSHomePage> createState() => _DNSHomePageState();
}

class _DNSHomePageState extends State<DNSHomePage> {
  final TextEditingController _dnsController =
      TextEditingController(text: 'dns.adguard-dns.com');

  String _status = '';

  void _connect() {
    setState(() {
      _status = 'Connected to ${_dnsController.text}';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_status)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom DNS'),
        actions: [
          IconButton(
            tooltip: 'Toggle Theme',
            icon: Icon(themeProvider.isDarkMode
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _dnsController,
              decoration: const InputDecoration(
                labelText: 'Private DNS Hostname',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.public),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.shield),
              label: const Text('Connect'),
              onPressed: _connect,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _status,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
