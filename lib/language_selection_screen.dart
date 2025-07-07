import 'package:flutter/material.dart';
import 'package:get_cally_app/signup_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> languages = [
    {'name': 'English', 'subtitle': 'Hi'},
    {'name': 'Hindi', 'subtitle': 'नमस्ते'},
    {'name': 'Bengali', 'subtitle': 'হ্যালো'},
    {'name': 'Kannada', 'subtitle': 'ನಮಸ್ಕಾರ'},
    {'name': 'Punjabi', 'subtitle': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'name': 'Tamil', 'subtitle': 'வணக்கம்'},
    {'name': 'Telugu', 'subtitle': 'హలో'},
    {'name': 'French', 'subtitle': 'Bonjour'},
    {'name': 'Spanish', 'subtitle': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Choose Your Language',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: languages.length,
                      separatorBuilder:
                          (context, index) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        return RadioListTile<int>(
                          value: index,
                          groupValue: _selectedIndex,
                          onChanged: (val) {
                            setState(() {
                              _selectedIndex = val!;
                            });
                          },
                          title: Text(languages[index]['name']!),
                          subtitle: Text(languages[index]['subtitle']!),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    final selectedLanguage = languages[_selectedIndex]['name'];
                    print("✅ Selected Language: $selectedLanguage");

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
