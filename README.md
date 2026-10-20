> // Questions de compréhension //
**Palier 2**
// Q1 : l'avatar se place aprés le texte parceque sans expanded la column prend de son contenu //
// Q2 : prénom est déclaré final car ses champs ne changent pas //
// Q3 : cs.primary change avec le thème et Colors.teal est fixe //

**Palier 3**
// Q4 : si DecoratedBox est en premier on ne voit pas le dégradé, dans un Stack, le premier enfant est au fond, le dernier devant. //
// Q5 : sans ClipRRect, l'image garde des coins carrés, le borderRadius n'est appliqué a aucun enfant, //
// Q6 : le positioned des textes a right : 130 car le texte reste dans la zone gauche et ne passe pas sous le bouton. //

**Palier 4**
// Q7 : spacer prend tout l’espace libre dans une Row. Sans Expanded, la Column ne connait pas sa largeur exacte, ce qui donne une erreur. Expanded lui donne l’espace restant. //
// Q8 : Pour ajouter une 7e destination, il faut ajouter dans la liste du fichier destinations.dart alors La carte sera crée automatiquement. //

**Palier 5**
// Q9 : sans setState, dans l'écran ne change pas et dans la mémoire la variable contient la nouvelle valeur mais n'appelle pas build. //
// Q10 : ... //
// Q11 : herobanner n'a aucune donnée qui change , il affiche destinations.first, l'état Homescreen change. //
