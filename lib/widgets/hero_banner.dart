import 'package:flutter/material.dart';
import '../models/destination.dart';

class HeroBanner extends StatelessWidget {
  final Destination destination;

  const HeroBanner({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(destination.image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${destination.note}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 130,
              bottom: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DESTINATION DU MOIS',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.nom,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    destination.region,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 20,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Découvrir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}