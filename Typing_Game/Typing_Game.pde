/* 
Arif Azeez
Jin Liu


Final Project - The Typing Challenge

Levels change by difficulty:
   Level 1: position and size of letter are constants
   Level 2: position changes but the size is constant
   Level 3: position changes and size too

The levels are fixed by the 1, 2, 3 keys.
Reset the game with 0 key.
Exit the game with esc key.
For start, press the space bar.
 
*/
 
 
import ddf.minim.*;
Minim minim;
 
//modify this for change the max time
int tInitial = 100;

AudioSample right;
AudioSample wrong;
 
PFont f;
int counter = 0;
int t = tInitial;
int points = 0;
int level = 1;
 
boolean run = false;
 
char[] letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
 
//initialize the currentLetter
char currentLetter = ' ';
//position and size of the letter (those change respect the level)
float px;
float py;
float letterSize = 250;
 
void setup()
{
  size(1000, 600);
  f = createFont("times", 16, true);
  textFont(f, 60);
   
  minim = new Minim(this);
  right = minim.loadSample("correct.wav");
  wrong = minim.loadSample("incorrect.wav");
  px = width / 2;
  py = 400;
  
  reset();
}
 
 
void draw()
{
  if (run == true)
  {
    counter += 1;
    fill(245,236,217);
    rect(0, 0, width, height);
 
    fill(0);
    //this is for do slow clock
    if (counter == 10)
    {
      t--;
      counter = 0;
    }
    textFont(f, letterSize);
    text(currentLetter, px, py);
     
    //if clock is zero, show the score
    if ( t <= 0)
    {
      t = 0;
      run = false;
      results();
    }
  } 
  //those lines are for draw the box of time, points, level
  textFont(f, 60);
  fill(43,172,181);
  rect(20, 20, 300, 60);
  fill(0);
  text("Time : " + str(t), 170, 75);
 
  fill(43,172,181);
  strokeWeight(5);
  rect(350, 20, 300, 60);
  fill(0);
  text("Points : " + str(points), 500, 75);
 
  fill(43,172,181);
  strokeWeight(5);
  rect(680, 20, 300, 60);
  fill(0);
  text("Level : " + str(level), 830, 75);
}
 
 
void keyPressed()
{
  switch(key)
  {
  case ' ':
    if (run == false)
    {
      currentLetter = randomLetter();
      run = true;
    }
    break;
  case '1':
    if ( run == false)
    {
      level = 1;
    }
    break;
  case '2':
    if ( run == false)
    {
      level = 2;
    }
    break;
  case '3':
    if ( run == false)
    {
      level = 3;
    }
    break;
  case '0':
    currentLetter = ' ';
    t = tInitial;
    run = false;
    points = 0;
    level = 1;
    px = width / 2;
    py = 400;
    letterSize = 250;
    reset();
    break;
  }
     
  if (run == true && key != ' ')
  {
    if (key == currentLetter)
    {
      //if the keypress is good, play correct sound
      points++;
      right.trigger();
    }
    else
    {
      //if the keypress is bad, play incorrect sound
      points--;
      wrong.trigger();
    }
     
    currentLetter = randomLetter();
    
    //Level selection
    if (level == 1)
    {
      px = width/2;
      py = 400;
      letterSize = 250;
    }
    else if (level == 2)
    {
      letterSize = 250;
      px = random(0, width - 70);
      py = random(letterSize, height - letterSize);
    }
    else if (level == 3)
    {
      letterSize = random(50, 250);
      px = random(0, width - 70);
      py = random(letterSize, height - letterSize);
    }
  } 
}
