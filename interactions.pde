


void keyPressed() {
  if (key == 'a') aKey = true;
  if (key == 'd') dKey = true;
  if (key == 'w') wKey = true;
  if (key == 's') sKey = true;
  
  //stats
  if (key == 'c') cKey = true;
  if (cKey) mode = STATS;
  
  //shop
  if (key == 't') tKey = true;
  
  //mode
  if (key == 'x') xKey = true; 
  
  //pause
  
  if (key == 'z') zKey = true;
 
  
 
//
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
}


void keyReleased() {
  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  
  //stats
  if (key == 'c') cKey = false;
  
  
  //pause
  if (key == 't') tKey = false;
  
  
  //mode
  if (key == 'x') xKey = false;
  if (key == 'z') zKey = false;


  if (keyCode == LEFT) leftKey =false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
}








void mouseReleased() {

 if (mode == INTRO){
    introClicks();
  } else if(mode == PAUSE){
    pauseClicks();
  } else if (mode == GAME){
    gameClicks();
  } else if (mode == GAMEOVER){
   gameOverClicks();
  } else if (mode == SHOP){
    shopClicks();
  } else if (mode == BUNNYFIGHT){
    bunnyClicks();
  } else if (mode == STATS) {
    statsClicks();
  } else if (mode == MEWO) {
    mewoClicks();
  } else if (mode == FIGHT1){
    fight1Clicks();
  } else if (mode == WINNER){
    winnerClicks();
  } else {
   println("ERROR! Mode is " + mode);
  }
  }
