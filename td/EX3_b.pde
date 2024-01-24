// R208, Antonin MICHON
// Exercice 3)a,

int tab[]={1,3,5,7,11,13,17,19,23,27};
int X = 4;
boolean find = false;

void setup(){
  for(int i=0; i<tab.length; i++){
    if(tab[i] == X && !find){
      find = true;
    }
  }
  if(find){
    println(X + " est présent de le tableau tab");
  }else{
    println(X + " n'est pas présent dans le tableau tab");
  }
}
