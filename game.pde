

void gameClicks() {
  mode = PAUSE;
}




void game() {

  background(255);


  strokeWeight(2);
  fill(255);
  rect(sunnyx - 38, sunnyy - 75, 90, 10);
  fill(0, 255, 0);
  rect(sunnyx - 38, sunnyy - 75, w, 10);

  if (w < 60) {
    fill(255, 172, 70);
    rect(sunnyx - 38, sunnyy - 75, w, 10);
  }
  if (w < 30) {
    fill(255, 0, 0);
    rect(sunnyx - 38, sunnyy - 75, w, 10);
  }


  strokeWeight(2);
  fill(255);
  rect(basilx - 40, basily - 60, 90, 10);
  fill(0, 255, 0);
  rect(basilx - 40, basily - 60, wb, 10);

  if (wb < 60) {
    fill(255, 172, 70);
    rect(basilx - 40, basily - 60, wb, 10);
  }
  if (wb < 30) {
    fill(255, 0, 0);
    rect(basilx - 40, basily - 60, wb, 10);
  }










  if (healths == 0) {
    mode = GAMEOVER;
    healths = 500;
    healthb = 500;
  }


  if (healthb == 0) {
    mode = GAMEOVER;
    healthb = 500;
    healths = 500;
  }




  //iamges
  image(bunni, bunnix, bunniy, 50, 50);
  image(apple, applex, appley, applew, appleh);


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

  //mewo
  image(mewo, mewox, mewoy, 20, 20);
  
  // collision
  if (dist(sunnyx, sunnyy, mewox, mewoy) <= 10 + 25) {
    //basically finding the slope
    mode = MEWO;
  }

  if (dist(basilx, basily, mewox, mewoy) <= 10 + 25) {
    mode = MEWO;
  }

//





  //apple
  // collision
  if (dist(sunnyx, sunnyy, applex, appley) <= 25 + 25) {

    applex = random(25, 575);
    appley = random(25, 575);
    point = point + 1;
  }

  if (dist(basilx, basily, applex, appley) <= 25 + 25) {

    applex = random(25, 575);
    appley = random(25, 575);
    point2 = point2 + 1;
  }



  //bunni collision
  if (!bunniOn && random(100) < 1) {
    bunnix = random(25, 575);
    bunniy = random(25, 575);
    bunniOn = true;
  }

  if (bunniOn) {
    image(bunni, bunnix, bunniy, 50, 50);
  }

  if (dist(sunnyx, sunnyy, bunnix, bunniy) <= 25 + 25) {
    mode = BUNNYFIGHT;
     bunniOn = false;
  }


  if (dist(basilx, basily, bunnix, bunniy) <= 25 + 25) {
    mode = BUNNYFIGHT;
    bunniOn = false;
  }
}
