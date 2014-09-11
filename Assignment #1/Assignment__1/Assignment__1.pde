void setup()
{
  size(800,700);
  background(255);
}

void draw()
{
  fill(random(255),random(255),random(255),random(100,255));
  ellipse(mouseX,mouseY,100,100);
  frameRate(20); 
}

void keyPressed()
{
  if(key == 'r') 
  {
    background(255); 
  }
}
