// R208, TD1 Lundi 22 Janvier :

/**  
  Fonction xMax :
  Paramètres : int X1, int X2, int X3
  Retour : int
  
  Renvoie le plus grand élément parmi les 3 paramètres
*/
int xMax(int X1, int X2, int X3) {
    // Première valeur considéré comme le maximum
    int max = X1;
    // Vérifie si la deuxième valeur est plus grande
    if (X2 > max) {
        max = X2;    // Si oui alors la valeurs de max est changé
    }
    // Vérifie si la troisième valeur est plus grande
    if (X3 > max) {
        max = X3;
    }
    // Renvoie la valeur maximale
    return max;
}

void setup() {
    // Définition des valeurs x1, x2 et x3
    int x1 = -5;
    int x2 = -18;
    int x3 = 0;
    // Appel de la fonction xMax avec les valeurs définies
    int maxValue = xMax(x1, x2, x3);
    // Affiche la plus grande valeur en console
    print("La valeur la plus grande parmi " + x1 + ", " + x2 + " et " + x3 + " est " + maxValue);
}
