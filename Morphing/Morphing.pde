//slike
PImage pic1, pic2;
//scroll bar
Slider s;
//visina prozora
int height = 700;
//dužina prozora
int width = 600;

//koeficijent koji utječe na morph
float alpha = 0;//float izmedu 0 i 1

// niz koordinata slika
int[] numbers1;
int[] numbers2;
int[] indexi;

//linije stringova
String[] lines1;
String[] lines2;
String[] lines;

//boolean koji označava početak programa
boolean begin = true;

String time = ""; //string u kojem pise vrijeme
boolean done = true; //boolean koji govori je li transformacija zavrsila
int timesPressed = 0;//int koji govori koliko je puta pritisnut miš, kako bi
//se znalo da li se vrijeme pokazuje ili briše na pritisak SPACE-a

//pomocni indexi za kreiranje trokuta
int j, k;
//funkcija koja obavlja transformacije nad dva trokuta, pomoću dane alphe
Triangle transform (float alpha, Triangle prvi, Triangle drugi)
  {
    Triangle mix = new Triangle();
    mix.Ax = (int) ((1-alpha) * prvi.Ax + alpha * drugi.Ax); 
    mix.Ay = (int) ((1-alpha) * prvi.Ay + alpha * drugi.Ay); 
    mix.Bx = (int) ((1-alpha) * prvi.Bx + alpha * drugi.Bx); 
    mix.By = (int) ((1-alpha) * prvi.By + alpha * drugi.By); 
    mix.Cx = (int) ((1-alpha) * prvi.Cx + alpha * drugi.Cx); 
    mix.Cy = (int) ((1-alpha) * prvi.Cy + alpha * drugi.Cy); 
    
    return mix;
  }

//niz trokuta
Triangle[] triangle1;
//niz trokuta
Triangle[] triangle2;
//niz trokuta koji su dobiveni kombinacijom prvih i drugih trokuta
Triangle[] srednji;

//početak rada, postavljanje svega
void setup()
{   size(600,805,P3D);
    background(255);
    s = new Slider(0, 650, width);
    
    pic1=loadImage("pic1.png");
    pic2=loadImage("pic2.png"); 
    
    lines1=loadStrings("pic1.data");
    lines2=loadStrings("pic2.data");
    
    lines = loadStrings("indexi.data");
    indexi = new int[402];
    
    numbers1 = new int[86];
    triangle1 = new Triangle[67];
    
    numbers2 = new int[86];
    triangle2 = new Triangle[67];
    
    srednji = new Triangle[67];
    
    FirstDraw(triangle1, triangle2, numbers1, numbers2);
    
}

//crtanje
void draw()
{
  s.update();
  s.display();
  
  if(begin){
    FirstDraw(triangle1, triangle2, numbers1, numbers2);
    transform_triangle(0.0);
    begin = false;
  };
  
}
