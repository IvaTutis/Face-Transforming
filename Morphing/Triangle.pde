//klasa koja opisuje trokut 
class Triangle{
  int Ax, Ay;//prva tocka
  int Bx, By;//druga tocka
  int Cx, Cy;//treca tocka
  
  //............................................konstruktori klase
  
  //default konstruktor
  Triangle() {  
    Ax = 0; Ay = 0; 
    Bx = 0; By = 0; 
    Cx = 0; Cy = 0; 
    }
  
  //konstruktor
  Triangle (int t1, int t2, int t3, int t4, int t5, int t6) {
    Ax=t1; Ay=t2;
    Bx=t3; By=t4;
    Cx=t5; Cy= t6;
    }

  //...........................................metode klase
  
  //crta trokut
  void tdraw(){  
    noFill();
    triangle(Ax, Ay, Bx, By, Cx, Cy);
    }
  
  
}
