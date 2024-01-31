// Code par MICHON Antonin; BUT Réseau & Télécommunication
// https://github.com/HookSandeer/R208

import processing.sound.*;

SoundFile sound; // Déclarer la variable pour stocker le son
// Déclaration des variables globales :
int choice;                   // Stocke le choix de balle  
float initBallY;                // Stocke l'altitude initiale de la balle
float ballY;             // Stocke l'altitude actuelle de la balle
float initBallX;                  // Stocke la position sur la largeur
float ballX;               // Stock la largeur actuelle
float speed;                  // Stocke la vitesse de la balle
float bounceStrength;         // Stocke la force du rebond
float ballSize;               // Stocke la taille de la balle
boolean isMoving = true;      // Stocke l'état de déplacement de la balle
boolean isFalling = true;     // Stocke le sens de déplacement de la balle
// création des variable pour les images :
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
  // Taille de la balle en fonction de la taille de la fenêtre (40%)
  ballSize = width * 0.4;
  // Initialise la position initiale de la balle (20% sous la barre supérieure) :
  initBallY = height * 0.2;
  // Mise à jour de la position actuelle de la balle :
  ballY = initBallY;
  // Initialise la vitesse de la balle :
  speed = 1;
  // Initialise le son, grâce à l'objet créé à la ligne 3 :
  sound = new SoundFile(this, "bounce.mp3");
}

void draw(){
  background(255); // Réinitialisation de la fenêtre afin d'avoir un nouvel affichage
  fill(0);        // Texte en noir
  textSize(20);   // Taille du texte
  textAlign(CENTER);      // Alignement du texte
  text("Appuyez sur les touches 1, 2 ou 3 pour choisir la balle", width/2, 30);      // Texte et position x=largeur/2, y=30
  // La balle arrive au sommet de son rebond ....
  if(speed <= 1){ // ... Si la vitesse devient nulle,
    isFalling = true; // Alors la balle tombe à nouveau
  }
  
  // Si la balle bouge :
  if(isMoving){
    // Si la balle tombe :
    if(isFalling){
      ballY += speed; // Sa position descend en fonction de sa vitesse
      // Sa vitesse augmente lors de sa chute
      switch(choice){
        case 1: speed *= 1.7; break;    // Physique balle en bois (prise de vitesse importante)
        case 2: speed *= 1.1; break;    // Physique ballon de baudruche (prise de vitesse faible)
        case 3: speed *= 1.3; break;   // Physique balle en caoutchouc (prise de vitesse moyenne)
      }
    // Si la balle remonte :  
    } else {
      ballY -= speed; // Sa position remonte en fonction de sa vitesse
      // Sa vitesse diminue lorsqu'elle remonte
      switch(choice){
        case 1: speed *= 0.3; break;    // // Balle en bois, perd rapidement sa vitesse
        case 2: speed *= 0.9; break;    // Ballon de baudruche, perd peu de vitesse
        case 3: speed *= 0.7; break;   // Balle en caoutchouc; perd moyennement sa vitesse
      }
    }
  }
   
  // Si la balle touche le sol (la bordure de la fenêtre)
  if(ballY > height - ballSize){
    isFalling = false; // Alors la balle arrête de tomber et rebondit
    if(isMoving){    // Si la balle bouge encore ...
      sound.play(); // ... Alors le son du rebond est joué
    }
    // Rigidité de la balle :
    switch(choice){
      case 1: speed *= 0.5; break;        // Balle en bois perd beaucoup d'energie
      case 2: speed *= 0.9; break;        // Ballon de baudruche perd peu d'énergie
      case 3: speed *= 0.75; break;       // Balle en caoutchoud perd de l'énergie
    }
  }
   
  /**
   * Si la balle a une vitesse inférieure à 0, c'est-à-dire qu'elle va retomber,
   * et qu'elle se situe dans le bas de la fenêtre, alors la balle arrête de bouger
   * et le programme s'arrête ici
   */
  if(speed < 2 && ballY >= height - ballSize){
    isMoving = false;
    background(0, 255, 0);        // Fond de la fenêtre en noir
  }

  // Dessine l'image de la balle, en fonction du choix de l'utilisateur pour avoir la bonne balle
  switch(choice){
    case 1: image(bois, width/3, ballY, ballSize, ballSize); break;
    case 2: image(ballon, width/3, ballY, ballSize, ballSize); break;
    case 3: image(balle, width/3, ballY, ballSize, ballSize); break;
  }
}

void keyPressed() {
  // Change la valeur de "choice" lorsque l'utilisateur appuie sur une touche, et rénitialise l'état de la balle
  if (key == '1' || key == '2' || key == '3') {
    choice = int(key) - int('0');
    isMoving=true;
    speed=1;
    ballY = initBallY;
  }
}
