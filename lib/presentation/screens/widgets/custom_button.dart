import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed, 
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: FilledButton(
        onPressed: onPressed,
        child: isLoading ? CircularProgressIndicator( color: Theme.of(context).colorScheme.onPrimary,) : Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
