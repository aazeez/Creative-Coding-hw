void reset()
{
  fill(180,204,185);
  rect(0, 0, width, height);
     
  PImage img = loadImage("spongebob.gif");
  image(img, 400, 150, 374, 323);
   
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(30, 150, 260, 323);
  textFont(f, 20);
  textAlign(CENTER);
  fill(255, 0, 0);
  text(" Typing game", 140, 180);
  textFont(f, 16);
  textAlign(LEFT);
  fill(0);
  text("Time to test your keyboard \ntyping skills!! ", 47, 210);
  text("These are the commands:\n 0 = reset \n 1, 2, 3 = set level \n Spacebar = start the game\n esc = exit", 47, 290);
   
  textAlign(CENTER);
   
  textFont(f, 60);
  fill(245,236,217);
  rect(20, 20, 300, 60);
  fill(0);
  text("Time : " + str(t), 170, 75);
 
  fill(245,236,217);
  strokeWeight(5);
  rect(350, 20, 300, 60);
  fill(0);
  text("Points : " + str(points), 500, 75);
 
  fill(245,236,217);
  strokeWeight(5);
  rect(680, 20, 300, 60);
  fill(0);
  text("Level : " + str(level), 830, 75);
}

