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


> // Questions d'Atelier 4 //

**Palier 2**
// Q1 : oui, le filtre est conservé. Navigator gère une pile d'écrans : push pose DetailScreen par-dessus HomeScreen,pop retire le détail et on retrouve HomeScreen tel qu'il était. //

// Q2 : DetailScreen reçoit la destination par son constructeur, le mécanisme est un widget reçoit ses données par des paramètres final.

// Q3 : sans clipBehavior, l'effet (ripple) déborde des coins arrondis de la carte : on voit des coins carrés au moment du toucher.


**Palier 3**
// Q1 : appelle le validator de chaque champ du Form, affiche les messages d'erreur sous les champs invalides et renvoie true si tous
// les validateurs renvoient null, sinon false.

// Q2 : inputFormatters filtre la frappe en direct. validator vérifie la valeur finale quand on appelle validate() et affiche le message d'erreur.

// Q3 : un TextEditingController garde des ressources. dispose() les libère quand l'écran est détruit : sans cela, fuite de mémoire.

**Palier 4**
// Q1 Avec readOnly + showDatePicker, la valeur est toujours une vraie date comprise dans la période autorisée. sinon Sans readOnly, l'utilisateur
// pourrait taper une date invalide.

// Q2 : Quand setState change _formule, build() est rappelé et lit _total avec la nouvelle formule.

**Palier 5**
  // Q1 : si l'utilisateur quitte le formulaire avec la flèche retour, pop est appelé sans valeur : reservation vaut null.

  // Q2 : après un await, l'écran a pu être fermé entre-temps. Sans le test mounted, VS Code avertit  : utilisercontext sur un écran qui n'existe plus peut provoquer une erreur.

  // Q3 : une boîte de dialogue est elle aussi une route posée sur la pile de navigation, comme un écran : on la ferme avec Navigator.pop.