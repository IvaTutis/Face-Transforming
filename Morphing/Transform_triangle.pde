//funkcija za transformaciju trokuta
void transform_triangle(float alpha){
  
  //average trokuta iz obiju slika
  for(int i=0; i<67; i++) srednji[i] = transform (alpha, triangle1[i], triangle2[i]);
      
  //transformacije na prvoj/drugoj slici  
    for(int i=0; i<67; i++)
    {       
      //morphing prve slike
      tint(255);
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(pic1);
      vertex(srednji[i].Ax, srednji[i].Ay, triangle1[i].Ax, triangle1[i].Ay);
      vertex(srednji[i].Bx, srednji[i].By, triangle1[i].Bx, triangle1[i].By);
      vertex(srednji[i].Cx, srednji[i].Cy, triangle1[i].Cx, triangle1[i].Cy);
      endShape();
      
      //blending s drugom slikom
      tint(255, alpha*255);
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(pic2);
      vertex(srednji[i].Ax, srednji[i].Ay, triangle2[i].Ax, triangle2[i].Ay);
      vertex(srednji[i].Bx, srednji[i].By, triangle2[i].Bx, triangle2[i].By);
      vertex(srednji[i].Cx, srednji[i].Cy, triangle2[i].Cx, triangle2[i].Cy);
      endShape();
    }
}
