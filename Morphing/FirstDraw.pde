
//funkcija koja crta trokute za prvu sliku tokom inicijalizacije
void FirstDraw(Triangle[] triangle1, Triangle[] triangle2, int[] numbers1, int[] numbers2){
    
    for(int i = 0; i < lines1.length; i++) {
        String[] pom = splitTokens(lines1[i]);
        j = int(pom[0]);
        numbers1[2*i]=j;
        j = int(pom[1]);
        numbers1[2*i+1]=j;
        
        pom = splitTokens(lines2[i]);
        j = int(pom[0]);
        numbers2[2*i]=j;
        j = int(pom[1]);
        numbers2[2*i+1]=j;
      }
      
    //indexi za kreiranje trokuta, da ne moramo ručno raditi trokute jer su indexi za svaku sliku isti
    for(int i=0; i<lines.length; i++){
      String[] pom = splitTokens(lines[i]);
      
      for(int j=0; j<6; j++){
        k = int(pom[j]);
        indexi[i*6+j] = k;
        //println(k);
      }
    }
    
    for(int i=0; i<67; i++){
      triangle1[i] = new Triangle(numbers1[indexi[i*6]], numbers1[indexi[i*6+1]], numbers1[indexi[i*6+2]], numbers1[indexi[i*6+3]], numbers1[indexi[i*6+4]], numbers1[indexi[i*6+5]]);
      triangle2[i] = new Triangle(numbers2[indexi[i*6]], numbers2[indexi[i*6+1]], numbers2[indexi[i*6+2]], numbers2[indexi[i*6+3]], numbers2[indexi[i*6+4]], numbers2[indexi[i*6+5]]);
    }
 }
