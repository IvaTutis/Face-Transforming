//funkcija koja vraca bool je li mis nad nekim kvadrom na slici --->DONE
boolean overRect(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) { return true; } 
      else { return false; }
  }

//funkcija koja dize flagove ovisno je li mis nad buttonom/slikom/nicime --->DONE
void update(int x, int y) {

  if ( overRect(rectX1, rectY1, dim1, dim2) ) { //nad button1
    overbutton1 = true;
    overbutton2 = false;
    overpicture = false;
    
  } else if (overRect(rectX2, rectY2, dim1, dim2)){ //nad button2
    overbutton1 = false;
    overbutton2 = true;
    overpicture = false;
    
  } else if(overRect(0, 205, 600, 600)){ //nad slikom
    overbutton1 = false;
    overbutton2 = false;
    overpicture = true;
    
  } else { //nad nicim
    overbutton1 = false;
    overbutton2 = false;
    overpicture = false;
    
  }
}

//funkcija koja procesira klik miša ako je nad gumbom ili slikom, te 
void mousePressed() {
  if (overbutton1) { //ako kliknemo na button1, mijenja sliku koju prikazuje i piše u datoteku prve slike
    image = image1; 
    output = output1;
    
  }
  if (overbutton2) { //ako kliknemo na button2, mijenja sliku koju prikazuje i piše u datoteku druge slike
    image = image2;
    output = output2;  
    
  }
  if(overpicture){ //ako kliknemo na sliku, upisuje koordinate u odgovarajucu output datoteku
  
    tocka = mouseX + "\t" + (mouseY - 205);  //radi polozaja gumba
    output.println(tocka);
    output.flush();
  }
}
