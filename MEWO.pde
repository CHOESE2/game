void mewoClicks(){
  
  
}

void mewo(){
  background(255);
  
  
  image(sunny, sunnyx, sunnyy, sunnyw, sunnyh);
  image(basil, basilx, basily, basilw, basilh);
  

  //KEY CODE
  if (leftKey) sunnyx -= 5;
  if (rightKey) sunnyx += 5;
  if (upKey) sunnyy -= 5;
  if (downKey) sunnyy += 5;

  // KEY
  if (aKey) basilx -= 5;
  if (dKey) basilx += 5;
  if (wKey) basily -= 5;
  if (sKey) basily += 5;



   stroke(0);
   strokeWeight(2);
   fill(255);
   rect(sunnyx - 38, sunnyy - 75, 90, 10);
   fill(0, 255, 0);
  rect(sunnyx - 38, sunnyy - 75, w, 10);
  
  if (w < 60){
    fill(255, 172, 70);
    rect(sunnyx - 38, sunnyy - 75, w, 10);
  }
  if (w < 30){
    fill(255, 0, 0);
    rect(sunnyx - 38, sunnyy - 75, w, 10);
  }
  
    
  
  strokeWeight(2);
   fill(255);
  rect(basilx - 40, basily - 60, 90, 10);
  fill(0, 255, 0);
  rect(basilx - 40, basily - 60, wb, 10);
  
   if (wb < 60){
    fill(255, 172, 70);
    rect(basilx - 40, basily - 60, wb, 10);
  }
  if (wb < 30){
    fill(255, 0, 0);
    rect(basilx - 40, basily - 60, wb, 10);
  }
  
  
  














 strokeWeight(5);
  stroke(0);
  fill(255);
  image(mewo, mewox, mewoy, mewow, mewoh);


  ////velocity + acceleration = gravity
  //vx += ax;
  //vy += ay;


  //movement
  mewox += vx;
  mewoy += vy;


  //mewo
  if (mewoy <= 0) { // top
    vy = vy * -0.95; //positive * negative = negative
    // mewoy = mewow/2 + mewoh/2; // when the ball is outside the walls this ensures bally is set back to within the walls,
  }

  if (mewoy >= height - 25) { //bottom
    vy = vy * -0.95; //reverse the vy. Negative * negative = positive
    mewoy = height - 25;
  }
  if (mewox <= 0) {// right
    vx = vx * -0.95;
  }

  if (mewox >= width - 25) { //left
    vx = vx * -0.95; //reverse the vx
    mewox = width - 25;
  }



  // collision
  if (dist(sunnyx, sunnyy, mewox, mewoy) <= 25 + 25) {
     healths = healths - 1;
     w = w - 1;
  } if (w <= 0){
    w = 90;
    wb = 90;
    mode = GAMEOVER;
  }

  if (dist(basilx, basily, mewox, mewoy) <= 25 + 25) {
 healthb = healthb - 1;
     wb = wb - 1;
  } if (wb <= 0){
    w = 90;
    wb = 90;
    mode = GAMEOVER;
  }


}
