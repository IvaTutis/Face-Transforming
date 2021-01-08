class Slider{
  //......................................................podaci klase
  int scrollbar_width;   // sirina slidera; ujedno sirina ekrana
  int scrollbar_height;  //visina slidera i ujedno dimenzija kvadratica na slideru
  float xpos, ypos;      // x and y pozicije slidera
  float min, max;         // max and min vrijednosti od slidera
  int loose;              // how loose/heavy
  
  float position;        //trenutna pozicija slidera
  float newposition;     // nova pozicija slider
  
  boolean over;           // zastavica koja je true kada je mis iznad slidera
  boolean locked;         //zastavica koja govori je li slider locked 
  float ratio;            //omjer sirine ekrana i sirine ekrana-visine slidera slidera

  int minSPosition = 0;        
  int maxSPosition = 583;  
  float alphaCoef = 11.66;//alpha koeficijent
  
  boolean done;          //Zastavica koja oznacava je li trenutna transformacija gotova
  double time;           //vrijeme potrebno za izvrsenje trenutne transformacije
  
  //.........................................................konstruktori
  
  Slider(float xp, float yp, int screen_width) {
    //pocetna pozicija je skroz nalijevo
    position = 0; //crta skroz lijevo
    newposition = position;
    
    
    //dimenzije slidera
    scrollbar_width = screen_width;
    scrollbar_height = 16;
    int widthtoheight = screen_width- 16;
    ratio = (float)screen_width / (float)widthtoheight;
    xpos = xp;
    ypos = yp-scrollbar_height/2;
    min = xpos;
    max = xpos + scrollbar_width - scrollbar_height;
    loose = 3;
  }
  
  //..............................................metode funkcije klase

  void update() {
    //je li miš preko slidera
    if (overEvent()) {over = true;} else { over = false; } 
    //ako je miš preko slidera i pritisnuta tipka miša
    if (mousePressed && over) {locked = true;}
    //ako miš nije pritisnut
    if (!mousePressed) { locked = false; }
    //ako je miš pritisnut preko slidera (flag locked je true) onda po poziciji miša odredi novu poziciju kvadratića na slideru
    if (locked) { newposition = constrain(mouseX-scrollbar_height/2, min, max);  }
    
    //ako je nova pozicija razlicita od stare, vrši promjenu
    if (abs(position - newposition) > 1) {
      position = position + (newposition-position)/loose;
      
      //nacrtaj kvadratić na no
      fill(255);
      rect(0, 0, 600, 600);
      

      done = false;
      double before = getTimeInSeconds();
      textureMode(IMAGE);

      int times = howMany(position);
      alpha = s.getAlpha(times);
      transform_triangle(alpha);
      double after = getTimeInSeconds();
      time = after - before;
      done = true;
 
      fill(255);
      rect(200, 720, 400, 200);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      text("Alpha: " + alpha, 300, 750);
      
     }
     
    if(done == false){ done = true; } //završi sa događajem
  }

  int howMany(float s){  return floor(s/alphaCoef);}
  
  //funkcija koja vraca vrijednost unutar intervala, min ili max ako je van nj
  float constrain(float val, float minv, float maxv) {  return min(max(val, minv), maxv); }

  //funkcija koja vraća bool je li miš nad sliderom
  boolean overEvent() {
        if (mouseX > xpos && mouseX < xpos+scrollbar_width && mouseY > ypos && mouseY < ypos+scrollbar_height) { return true; }
        else { return false; }
        }

  //funkcija koja crta slider
  void display() {  
    noStroke();
    fill(200);
    
    //crta slider
    rect(xpos, ypos, scrollbar_width, scrollbar_height); 
    if (over || locked) { fill(0, 0, 0);  } 
    else {  fill(1, 1, 1);  }
    
    //crta kvadratic slidera koji mozemo vuci
    rect(position, ypos, scrollbar_height, scrollbar_height);
    }
  
  //...........................................getteri
  
  //vraca vrijeme transformacije u sekundama  
  double getTimeInSeconds(){ return ((double)millis()/1000); } 
  
  //vraca vrijeme transformacije
  double getTime(){ return time; } 
  
  //vraca bool je li transformacija gotova
  boolean getDone(){ return done;} 
  
   //funkcija koja vraca alphu ovisno o pomaku slidera t
  float getAlpha(int t) {
      float a = t * 0.02; //pomak*korak
   
      //ovo se radi zbog točnosti, da izbjegnemo decimale viška
       if(t == 5){ a = 0.10;
         }else if(t == 9 ){ a = 0.18;
         }else if(t == 10){ a = 0.20;
         }else if(t == 15){ a = 0.30;
         }else if(t == 18){ a = 0.36;
         }else if(t == 20){ a = 0.40;
         }else if(t == 23){ a = 0.46;
         }else if(t == 27){ a = 0.54;
         }else if(t == 30){ a = 0.60;
         }else if(t == 33){ a = 0.66;
         }else if(t == 36){ a = 0.72;
         }else if(t == 40){ a = 0.80;
         }else if(t == 43){ a = 0.86;
         }else if(t == 46){ a = 0.92;
         }else if(t == 49){ a = 0.98;}
    
       return a;
     }
}
