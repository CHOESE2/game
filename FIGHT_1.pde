




// carrot blaster
void fight1Clicks() {
  mode = PAUSE;
}

void fight1() {
  background(255);


  //images/ angry gifs
  image(GGIF[fr], 300, 250, 125, 125);
  println(frameCount);
  if (frameCount % 10 == 0) fr = fr + 1;
  if (fr == frame) fr = 0;




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

  image(sunny, sunnyx, sunnyy, sunnyw, sunnyh);
  image(basil, basilx, basily, basilw, basilh);
  
      stroke(0);
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




  //array

if (mode != previousMode) {
    raining = true;
    stopTime = millis() + 30000;  // 30 seconds of rain
    previousMode = mode;
  }
  
  if (millis() >= stopTime) {
    raining = false;
  }

  int i = 0;
  float speed = 4;


  if (raining) {


    while (i < n) {
      acidRain(x[i], y[i]);   // draw the rain
      y[i] += speed;




      //acid rain
      // collision
      if (dist(sunnyx, sunnyy, x[i], y[i]) <= 25 + acidRainw + acidRainh) {
        x[i] = random(0, 600);
        y[i] = random(-500, 0);
        healths = healths - 2;
        w = w - 2;
      }
      if (w <= 0) {
        w = 90;
        wb = 90;
        i = i + 1;
        mode = GAMEOVER;
      }

      if (dist(basilx, basily, x[i], y[i]) <= 25 + acidRainw + acidRainh) {
        x[i] = random(0, 600);
        y[i] = random(-500, 0);
        healthb = healthb - 2;
        wb = wb -2;
      }
      if (wb <= 0) {
        w = 90;
        wb = 90;
        i = i + 1;
        mode = GAMEOVER;
      }


      if (y[i] > height) {
        x[i] = random(0, 600);
        y[i] = random(-500, 0);
      }
      i = i + 1;

        if (!raining) {
          textSize(25);
          fill(0);
          text("The rain has stopped!", 180, height / 2);
          
        }
      }
   
  }

}




// dunno if rain restarts after changing modes, could just be because last 30 seconds wasn't finished
 



  void acidRain(float x, float y) {
    pushMatrix();
    translate(x, y);
    strokeWeight(5);
    stroke(255, 0, 0);
    rect(acidRainx, acidRainy, 2, acidRainh + 10);
    popMatrix();
  }





  void tac (int x, int y, int w, int h) {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      stroke(255, 0, 0);
    } else stroke(255);
  }
