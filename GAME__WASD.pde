import processing.sound.*;


//mode framework
int mode; //scene, what screen we're on

//health
int healths;
int healthb;
//health bar
int w = 90;
int wb = 90;

//gif
PImage [] BGIF;
int frames;
int f;

//angry bunny

PImage [] GGIF;
int frame;
int fr;



final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int SHOP = 4;
final int BUNNYFIGHT = 5;
final int STATS = 6;
final int MEWO = 7;
final int FIGHT1 = 8;
final int WINNER = 9;




//images
PImage apple;
boolean appleOn;

PImage sunny;
boolean sunnyOn;

PImage mewo;
PImage free;
boolean freeOn;

PImage basil;
boolean basilOn;


//bunny variables
float bunnix, bunniy, bunniw, bunnih;
PImage bunni;
boolean bunniOn;



//acid rain
float acidRainx, acidRainy, acidRainw, acidRainh;
float avx, avy;     //acid's velocity
float aax, aay; // acceleration// mewo's gravity

// acid rain ARRAYS
float [] x;
float [] y;
int n;

//stop rain
int stopTime;
boolean raining = true;
int previousMode = -1;







//basil variable
float basilx, basily, basilw, basilh;

//sunny variables
float sunnyx, sunnyy, sunnyw, sunnyh;


//apple variables
float applex, appley, applew, appleh;

//purple color variables------------------------------
color whitep = #F2F4F2;
color p1 = #DDE2FC;
color p2 = #B9B5FC;
color p3 = #0E0E2F;


//key Variables-------------------
boolean aKey, dKey, wKey, sKey, upKey, downKey, leftKey, rightKey; //false by default
// pause
boolean tKey;


//mode
boolean xKey;
boolean zKey;
boolean cKey;

//mewo variables ENEMY!!
float mewox, mewoy, mewow, mewoh;
float vx, vy;     //mewo's velocity
float ax, ay; // acceleration// mewo's gravity




//score variables
int point;
int point2;

////sounds variable
//SoundFile fail;
//SoundFile sucess;
//SoundFile music;






void setup() {
  imageMode(CENTER);
  size(600, 600);
  
  
  
  //health;
  healths = 500;
  healthb = 500;
  
  
  
 

  
 
  
  

 
  //bunny
  frames = 4;
  
  BGIF = new PImage[ frames ];
  int index = 0;
  while (index < frames) {
    BGIF[index] = loadImage("frame_" + index + "_delay-0.2s.png");
    index = index + 1;
  }
  
 \// angry bunny
 frame = 4;
 int i = 0;
 
  GGIF = new PImage[ frame ];
  while (i < frame) {
    GGIF[i] = loadImage("frame_" + i + "_delay-0.2s.gif"); 
      i = i + 1;
  }



 //set up array of rain drops  
  n = 20; 
  x = new float [n];
  y = new float [n];

for (i = 0; i < n; i++) {
  x[i] = random(0, 600);
  y[i] = random(-500, 0);
}


if (mode == GAME){
raining = true;
stopTime = millis() + 30000; 
}

 
  
  

 

  //image bunni
  bunni = loadImage("bunny.png");

  bunnix = random(0, 450);
  bunniy = random(0, 450);
  bunniw = 130;
  bunnih = 130;


  //image basil
  basil = loadImage("basil.png");

  basilx = random(0, 450);
  basily = random(0, 450);
  basilw = 85;
  basilh = 85;






  //images
  apple = loadImage("apple.png");
  sunny = loadImage("sunny.png");
  mewo = loadImage("mewo.png");
  // free = loadImage("OLD_HOBO");


  ////load sounds
  //fail = new SoundFile(this, "FAILURE.wav"); //this refers to this sketch


  //mewo
  mewox = random(0, 450);
  mewoy = random(0, 450);
  mewow = 150;
  mewoh = 150;



  //apple
  applex = 0;
  appley = 0;
  applew = 100;
  appleh = 100;

  //sunny
  sunnyx = random(0, 450);
  sunnyy = random(0, 450);
  sunnyw = 280;
  sunnyh = 280;
  
  

  //acid rain
  acidRainx = 0;
  acidRainy = 0;
  acidRainw = 2;
  acidRainh = 0;

  //acids velocity
  avx = 0;
  avy = 5;
  
  //acids acceleration
  aax = 0;
  aay = 0;


  //mewo's velocity [ the speed at which the ball is moving is a certain direction ]
  vx = 6;
  vy = 6;
  //mewo's acceleration [ the change in the velocity of the ball ]
  ax = 0;
  ay = 6;




  //music.loop(); // plays sound for
  //music.amp(0.1); //loudness
  //fail.pan(); //0 is default, -1, or 1 makes sounds depending on which side headphone u have

  mode = INTRO;

  appleOn = true;
  applex= 100;
  appley = 100;
  
  
  
  point = 0;
  point2 = 0;


  
  
  
  
 
  
}








void draw() {


  if (mode == INTRO) {
    intro();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == SHOP) {
    shop();
  } else if (mode == BUNNYFIGHT) {
    bunny();
  } else if (mode == STATS) {
    stats();
  } else if (mode == MEWO){
    mewo();
  } else if (mode == FIGHT1){
    fight1();
  } else if (mode == WINNER){
    winner();
  } else {
    println("ERROR! Mode is " + mode);
  }
}








//void mouseReleased(){
//fail.play();  // likes overlapping use this
////fail.stop() // stops the previous one so no echo



void bunniOn(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  image(bunni, bunnix, bunniy, bunniw, bunnih);
  popMatrix();
}



void sunnyOn(float x, float y, float w, float h){
  pushMatrix();
  translate(x, y);
  image(sunny, sunnyx, sunnyy, sunnyw, sunnyh);
  popMatrix();

}


void appleOn(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  //scale(s);
  image(apple, applex, appley, applew, appleh);
  popMatrix();
}





void basilOn(float x, float y, float w, float h){
  pushMatrix();
  translate(x, y);
  //scale(s);
  image(basil, basilx, basily, basilw, basilh);
  popMatrix();
}
