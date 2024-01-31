import processing.sound.*;

SoundFile sound; // Déclarer la variable pour stocker le son
// Déclaration des variables globales :
int choice;                   // Stocke le choix de balle  
float initAlt;                // Stocke l'altitude initiale de la balle
float currentAlt;             // Stocke l'altitude actuelle de la balle
float speed;                  // Stocke la vitesse de la balle
float bounceStrength;         // Stocke la force du rebond
float ballSize;               // Stocke la taille de la balle
boolean isMoving = true;      // Stocke l'état de déplacement de la balle
boolean isFalling = true;     // Stocke le sens de déplacement de la balle
// création des images :
PImage balle;
PImage bois;
PImage ballon;

void setup(){
  // Initialisation de la fenêtre :
  size(800, 800);
  // Chargement des images :
  balle = loadImage("balle.png");
  bois = loadImage("bois.png");
  ballon = loadImage("ballon.png");
  // Initialisation du choix de balle :
  choice = 1;
  // Taille de la balle en fonction de la taille de la fenêtre (20%)
  ballSize = width * 0.4;
  // Initialise la position initiale de la balle (20% sous la barre supérieure) :
  initAlt = height * 0.2;
  // Mise à jour de la position actuelle de la balle :
  currentAlt = initAlt;
  // Initialise la vitesse de la balle :
  speed = 1;
  // Initialise le son, grâce à l'objet créé à la ligne 3 :
  sound = new SoundFile(this, "perfect-fart.mp3");
}

void draw(){
  background(255); // Réinitialisation de la fenêtre afin d'avoir un nouvel affichage
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Appuyez sur les touches 1, 2 ou 3 pour choisir la balle", width/2, 30);
  // Si la balle arrive au sommet de son rebond
  if(speed <= 1){ // Si la vitesse devient nulle,
    isFalling = true; // Alors la balle tombe à nouveau
  }
  
  // Si la balle bouge :
  if(isMoving){
    // Si la balle tombe :
    if(isFalling){
      currentAlt += speed; // Sa position descend en fonction de sa vitesse
      // Sa vitesse augmente lors de sa chute
      switch(choice){
        case 1: speed *= 1.7; break;    // Bois
        case 2: speed *= 1.1; break;    // Ballon
        case 3: speed *= 1.3; break;   // Balle
      }
    // Si la balle remonte :  
    } else {
      currentAlt -= speed; // Sa position remonte en fonction de sa vitesse
      // Sa vitesse diminue lorsqu'elle remonte
      switch(choice){
        case 1: speed *= 0.3; break;    // Bois
        case 2: speed *= 0.9; break;    // Ballon
        case 3: speed *= 0.7; break;   // Balle
      }
    }
  }
   
  // Si la balle touche le sol (la bordure de la fenêtre)
  if(currentAlt > height - ballSize){
    isFalling = false; // Alors la balle arrête de tomber et rebondit
    sound.play(); // Le son du rebond est joué
    // Rigidité de la balle :
    switch(choice){
      case 1: speed *= 0.5; break;
      case 2: speed *= 0.9; break;
      case 3: speed *= 0.75; break;
    }
  }
   
  /**
   * Si la balle a une vitesse inférieure à 0, c'est-à-dire qu'elle va retomber,
   * et qu'elle se situe dans le bas de la fenêtre, alors la balle arrête de bouger
   * et le programme s'arrête ici
   */
  if(speed < 2 && currentAlt >= height - ballSize){
    isMoving = false;
  }

  // Dessine l'image de la balle :
  switch(choice){
    case 1: image(bois, width/3, currentAlt, ballSize, ballSize); break;
    case 2: image(ballon, width/3, currentAlt, ballSize, ballSize); break;
    case 3: image(balle, width/3, currentAlt, ballSize, ballSize); break;
  }
}

void keyPressed() {
  // Change la valeur de "choice" lorsque l'utilisateur appuie sur une touche, et rénitialise l'état de la balle
  if (key == '1' || key == '2' || key == '3') {
    choice = int(key) - int('0');
    isMoving=true;
    speed=1;
    currentAlt = initAlt;
  }
}
