// R208, Antonin MICHON
// Exercice 1)a;

// Création d'un tableau de float (facilite le traitement)
float[] values = {3.5, 1.2, 2.8};

void setup() {
  // Fond de la fenêtre en blanc
  background(255);
  // Tri des valeurs dans l'ordre croissant
  sort(values);
  
  // Affichage des valeurs remise dans l'orde croissant
  for (int i = 0; i < values.length; i++) {
    println("Valeur " + (i + 1) + ": " + values[i]);
  }
  // Fond de la fenêtre en bleu lorsque le traitement est terminé
  background(0, 0, 255);
}
