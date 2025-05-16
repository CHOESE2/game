

void gameOverClicks(){
   if (mouseX > 220 && mouseX < 520 && mouseY > 100 && mouseY < 200) {
    mode = INTRO;
}
}




void gameOver() {
  background(0);
  textSize(40);
  fill(255);
  text("YOU WOKE UP..", 90, 300);
  textSize(20);
  text("it's ok, you'll be back", 200, 360);
  

  tactile(220, 100, 300, 100);
  rect(220, 100, 300, 100); //wake up button
  fill(0);
  textSize(30);
   text("go back to sleep?", 263, 158);
   fill(255);
   text("press ' x ' to visit SHOP", 255, 480);
}
  
  
  
  
  
  
  
  void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
    stroke(0, 0, 255);
  } else stroke(255);
  
}
    















  
