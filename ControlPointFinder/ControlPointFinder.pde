//slike koje oznacavaju prvu sliku, drugu sliku, i sliku koja se trenutno crta na ekran
PImage image1, image2, image;
//boolean varijable koje govore da li je mis nad nekim od gumbova, ili je nad slikom, ili nije nad nicim
boolean overbutton1, overbutton2, overpicture;

//pozicicije i dimenzije gumbova
int rectX1 = 0;
int rectX2 = 0;
int rectY1 = 10;
int rectY2 = 105;
int dim1 = 100; 
int dim2 = 100;

//tekst za tocku
String tocka = "";

//writer koji pise u datoteke, output jednako funkcionira kao image, mijenja se izmedu output1 i output2 
PrintWriter output1, output2; //outputi za slike
PrintWriter output; //metaoutput koji cemo switchati izmedju gornja 2 outputa

//pocetna funkcija koja ucitava slike i postavlja prvotnu sliku
void setup() {
  size(600, 805);
  image1 = loadImage("pic1.png");
  image2 = loadImage("pic2.png");
  image = image1;
  
  //pravi kod
  output1 = createWriter("pic1.data");
  output2 = createWriter("pic2.data");
  output = output1;
}

//funckija koja je zaduzena za crtanje 
void draw() {

  //update pozicije misa
  update(mouseX, mouseY); 
  background(200);

  //crta prvi button
  stroke(255);
  rect(0, 10, dim1, dim1);
  fill(50);
  textSize(20);
  text("pic1", 30, 50, 125, 25);


  //crta drugi button
  fill(255);
  stroke(255);
  rect(0, 105, dim2, dim2);
  fill(50);
  textSize(20);
  text("pic2", 30, 140, 125, 125);

  //crta trenutnu sliku
  image(image, 0, 205);
  
  //pise tekst za tocku na ekran
  fill(255);
  textSize(20);
  text(tocka, 250, 100);
 
}
