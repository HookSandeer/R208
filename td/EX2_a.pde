// R208, Antonin MICHON
// Exercice 2)a,
/**


// Variable global pour stoker la couleur du cercle
color couleurCercle;

void setup() {
  // Définit la taille de la fenêtre :
  size(400, 400);
  // Colorie le cercle en bleu au début du programme
  couleurCercle = color(0, 0, 255);
}

void draw() {
  // Fond de la fenêtre en blanc
  background(255);
  // Colorie le cercle avec la couleur actuelle
  fill(couleurCercle);
  ellipse(width / 2, height / 2, width/2, width/2);  // Dessine le cercle au centre de la fenêtre
}

// Lorsque l'utilisateur clique :
void mousePressed() {
  // Si la coueleur actuelle est bleu alors :
  if (couleurCercle == color(0, 0, 255)) {
    couleurCercle = color(0, 255, 0);  // Change de bleu à vert
  // Si la couleur actuelle est vert alors :
  }else if(couleurCercle == color(0, 255, 0)) {
    couleurCercle = color(255, 255, 0);  // Change de vert à jaune
  // Si la couleur actuelle est jaune
  }else if(couleurCercle == color(255, 255, 0)){
    couleurCercle = color(0, 0, 255);  // Change de jaune à bleu
  }
}


*/
