// display layer title
int nbTitles = 7;
String[] titles = new String[nbTitles];
void layerSetup() {
   titles[1] = "04 : Infornography"; 
}

void layerDisplay(float x, float y, float w, float h) {
   noStroke();
   fill(255);
   translate(x, y);
   String layer = "Layer ";
   // TODO
   // centrer le texte horizontalement et verticalement
   text(layer + titles[1], w/2, h/2);
   
}
