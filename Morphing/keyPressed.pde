//funkcija koja odgovara na pritisak SPACE tipke
void keyPressed(){
    
    //dohvaća vrijeme transformacije ako je gotova, i je li gotova (bool)
    done = s.getDone();
    time = String.valueOf(s.getTime());
    
    //obrađuje pritisak space tipke
   if(key == ' ' && done == true && timesPressed == 0){
     timesPressed++;
     textAlign(CENTER);
     textSize(16);
     fill(0);
     text("Time: " + time + " seconds", 300, 700);
     
         }else if(key == ' ' && done == true && timesPressed == 1){
                   timesPressed = 0;
                   fill(255);
                   rect(120, 680, 580, 40);
                   
         }else if(key == ' ' && done == false && timesPressed == 0) {
                 timesPressed++;
                 fill(255);
                 rect(120, 680, 580, 40);
                 fill(0);
                 time="Time: Not done yet...";
                  textAlign(CENTER);
                  textSize(16);
                  fill(0);
                  text(time, 300, 700);
         }else if(key == ' ' && done == false && timesPressed >= 1){
                  timesPressed = 0;
                  fill(255);
                  rect(120, 680, 580, 40);

         }
}
