import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageButton(
            label: 'EN',
            isActive: context.locale.languageCode == 'en',
            onTap: () => _setLanguage(context, 'en'),
          ),
          const SizedBox(width: 4),
          _LanguageButton(
            label: 'МН',
            isActive: context.locale.languageCode == 'mn',
            onTap: () => _setLanguage(context, 'mn'),
          ),
        ],
      ),
    );
  }

  void _setLanguage(BuildContext context, String code) {
    final locale = code == 'en' 
        ? const Locale('en', 'US')
        : const Locale('mn', 'MN');
    context.setLocale(locale);
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.red[300] : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}