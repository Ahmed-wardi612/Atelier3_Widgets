import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/favorite_button.dart';

class DetailScreen extends StatefulWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _voyageurs = 2;

  Widget _tuile(IconData icone, String libelle, String valeur) {
    final cs = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: cs.outlineVariant),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icone, color: cs.primary),
            const SizedBox(height: 8),
            Text(libelle, style: Theme.of(context).textTheme.bodySmall),
            Text(valeur, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.destination;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final haut = MediaQuery.of(context).padding.top + 12;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 340,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(d.image, fit: BoxFit.cover),
                Positioned(
                  top: haut,
                  left: 16,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Positioned(
                  top: haut,
                  right: 16,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const FavoriteButton(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            d.nom,
                            style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.place, size: 18, color: cs.onSurfaceVariant),
                              const SizedBox(width: 4),
                              Text(
                                d.region,
                                style: theme.textTheme.titleMedium?.copyWith(color: cs.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '${d.note}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _tuile(Icons.schedule, 'Durée', d.duree),
                    const SizedBox(width: 12),
                    _tuile(Icons.category_outlined, 'Type', d.categorie),
                    const SizedBox(width: 12),
                    _tuile(Icons.groups, 'Groupe', 'Max 12'),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'À propos',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  d.description,
                  style: theme.textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant, height: 1.4),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voyageurs',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: _voyageurs > 1
                          ? () {
                              setState(() {
                                _voyageurs--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('$_voyageurs', style: theme.textTheme.headlineSmall),
                    ),
                    IconButton.outlined(
                      onPressed: () {
                        setState(() {
                          _voyageurs++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total', style: theme.textTheme.bodyMedium),
                  Text(
                    '${d.prix * _voyageurs} DT',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                  child: const Text('Réserver'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}