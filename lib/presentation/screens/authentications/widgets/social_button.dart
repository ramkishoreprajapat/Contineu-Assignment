import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.title, required this.icon});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {    
    return Expanded(
      child: OutlinedButton.icon(
        icon: icon,
        onPressed: () => {},
        label: Text(title, style: Theme.of(context).textTheme.titleMedium,),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),        
        ),      
      ),
    );
  }
}
