//simple "old school" game, last as long as possible
//couldn't figure out how to display score
//The objective of the game is to get the circle into the square
//Arrow keys to move character(yellow circle)
//Do as title states before time runs out
//Press Y key or N key to continue or give up on "Game Over" screen
float x;//rectangle/target x-position
float y;//rectangle/target y-position
int d = 0;//makes rectangle smaller and smaller
int x2 = 0;//circle/main character x-position
int y2 = 0;//circle/main character x-position
float t = 0;//time function/causes game over
PFont font;
int s = 0;//displays "Intro", "Settings", "Game", "Game Over" or "Shut Down"
int e = 0;//circle x-position for demo on "Intro"
void setup(){
  size(400, 400);
  x = random(-200, 150);//rectangle location random
  y = random(-200, 150);//" "
  //don't know if font is remembered in submission, if not this is the font
  font = loadFont("Power_Red_and_Green-40.vlw");//gamey font
  textFont(font);
}
 
void draw(){
  translate(width/2, height/2);
  
  //"intro" screen
  if(s == 0){
    background(255);
    fill(0);
    textSize(35);
    text("Get to the Square", -130, -100);//title
    textSize(20);
    text("Press S to start", -70, -75);//"press start"
    textSize(25);
    text("Controls:Arrow keys", -100, -20);//controls
    textSize(15);
    text("You", -90, 30);
    textSize(15);
    text("Target", 55, 30);
    textSize(20);
    text("time is running out!", -76, 130);//rule of the game
    //s == Start button, leads to "Settings" screen
    if(keyPressed){
      if(key == 's'){
      s = 1;//"screen" is "Settings" screen
      }
    }
    //demo on "Intro" screen
      e += 2;
      if(e == 150)
      e = 0;
      fill(255, 0, 0);
      rect(50, 37, 50, 50);
      fill(255, 255, 0);
      ellipse(-80 + e, 60, 10, 10);
  }
  
  //"Settings" screen, press Q, W, or E to pick difficulty*
 else if(s == 1){
    background(255);
    fill(0);
    textSize(30);
    text("Difficulty?*", -63, -100);
    text("Easy(Q)", -40, -30);
    text("Normal(W)", -50, 10);
    text("Hard(E)", -40, 50);
    textSize(20);
    text("*not fully implemented", -87, 150);//*works once, returns to "Normal"
    //inputs for difficulty selection/lead to "Game" screen
    if(keyPressed){
      if(key == 'q'){
      t += .5;//longer amount of time(in theory)
      s = 2;//"screen" is "Game" screen
      }
    }
    if(keyPressed){
      if(key == 'w'){
      t++;//normal amount of time
      s = 2;//"screen" is "Game" screen
      }
    }
    if(keyPressed){
      if(key == 'e'){
      t += 4;//shorter amount of time(in theory)
      s = 2;//"screen" is "Game" screen
      }
    }
 }
  
  //"Shut Down" screen/picked do not continue (N) from "Game Over"
 else if(s == 3)
background(0); 
    
   //"Game" screen/actual game
 else if(s == 2){
 background(0);
  fill(255, 0, 0);
  rect(x, y, 50 - d, 50 - d);//target
 fill(255, 255, 0); 
  ellipse(x2, y2, 10, 10);//main character/you
  t++;//time function, counts up until 150, then "Game Over"
  //detects if circle is inside rectangle 
  if (((x2 > x)&&(x2 < x + 50 + d)&&(y2 > y)&&(y2 < y + 50 - d))){
    d++;//makes rectangle smaller each time circle is in rectangle
    x = random(-200, 150);//re-randomises location of rectangle
    y = random(-200, 150);//" "
    t = 0;//resets time
  } 
  //controls
  if (keyPressed && (key == CODED)){
  if (keyCode == LEFT){
   x2 -= 5;
  }
  }
  if (keyPressed && (key == CODED)){
  if (keyCode == RIGHT){
   x2 += 5;
  }
  }
  if (keyPressed && (key == CODED)){
  if (keyCode == UP){
   y2 -= 5;
  }
  }
  if (keyPressed && (key == CODED)){
  if (keyCode == DOWN){
   y2 += 5;
  }
}
//time runs out when t >= 120, leads to "Game Over"
 if (t >= 120){
   background(255);
   fill(0);
   textSize(40);
   text("Game Over", -78, -30);
   textSize(40);
   text("Continue?", -76, 10);
   textSize(40);
   text("(Y/N)", -35, 55);
   //Y leads to "Intro", N to "Shutdown"
    if(keyPressed){
      if(key == 'y'){
      s = 0;
      t = 0;
      d = 0;
      }
      if(key == 'n'){
      s = 3;;
      }
    }
    //same as "Y", leads to "Intro"
    //scrapped because with Y/N, only keyboard is used
    //if(mousePressed == true){
   // x = random(-200, 150);
    //y = random(-200, 150);
    //background(0);
    //t = 0;
    //x2 = 0;
    //y2 = 0;
    //d = 0;
    //s = 0;
   //}
 }
 }
}

