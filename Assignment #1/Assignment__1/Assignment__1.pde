void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
  fill(0);
  ellipse(300,300,100,150); 
}

void keyPressed()
{
  if(key == 'r') 
  {
    background(255); 
  }
}
