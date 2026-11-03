import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/destination.dart';
import '../models/reservation.dart';

class ReservationScreen extends StatefulWidget {
  final Destination destination;
  final int voyageurs;

  const ReservationScreen({
    super.key,
    required this.destination,
    required this.voyageurs,
  });

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telCtrl = TextEditingController();

  
  @override
  void dispose() {
    _nomCtrl.dispose();
    _emailCtrl.dispose();
    _telCtrl.dispose();
    super.dispose();
  }

  InputDecoration _deco(String label, IconData icone, {String? aide}) {
    return InputDecoration(
      labelText: label,
      helperText: aide,
      prefixIcon: Icon(icone),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  String? _validerNom(String? v) {
    if (v == null || v.trim().isEmpty) return 'Indiquez votre nom';
    if (v.trim().length < 3) return 'Au moins 3 caractères';
    return null;
  }

  String? _validerEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Indiquez votre e-mail';
    if (!RegExp(r'^[\w.+-]+@[\w-]+\.[\w.]+$').hasMatch(v.trim())) {
      return 'E-mail invalide (ex. : nom@mail.tn)';
    }
    return null;
  }


  String? _validerTel(String? v) {
    if (v == null || v.trim().isEmpty) return 'Indiquez votre téléphone';
    if (v.trim().length != 8) return '8 chiffres attendus';
    return null;
  }

  
  void _valider() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Formulaire valide')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.destination;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Réserver')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        d.image,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            d.nom,
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text('${d.duree} · ${widget.voyageurs} voyageur(s)'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Vos coordonnées',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nomCtrl,
                decoration: _deco('Nom complet', Icons.person_outline),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                validator: _validerNom,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailCtrl,
                decoration: _deco('E-mail', Icons.mail_outline),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validerEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telCtrl,
                decoration: _deco(
                  'Téléphone',
                  Icons.phone_outlined,
                  aide: '8 chiffres, sans indicatif',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ],
                textInputAction: TextInputAction.done,
                validator: _validerTel,
              ),
            ],
          ),
        ),
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
                    '${d.prix * widget.voyageurs} DT',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _valider,
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                  icon: const Icon(Icons.check),
                  label: const Text('Confirmer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}