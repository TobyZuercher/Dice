Die jim;

void setup()
{
  colorMode(HSB, 360, 100, 100);
  size(500, 500, P3D);
  camera(width - 25, height, (height/2.0) / tan(PI*30.0 / 180.0) - 100, width/2.0 + 25, height/2.0 + 20, 0, 0, 1, 0); //modified
  background(0, 0, 80);
  jim = new Die(47);
  noLoop();
  smooth();
}

void draw()
{
  noStroke();
  fill(0, 0, 80);
  rect(-1500, -1500, 4500, 4500);
  jim.diceValue = 0;
  jim.diceRolls = 0;
  for(int y = 75; y <= 425; y += 50)
  {
    for(int x = 75; x <= 425; x += 50)
    {
      jim.roll();
      jim.diceValue += jim.rollNumber;
      jim.diceRolls += 1;
      jim.place(x, y);
    }
  }
  fill(0);
  text("The combined value is " + jim.diceValue, 75, 475, 2);
  text("The total amount of rolls is " + jim.diceRolls, 290, 475, 2);
}

void mouseClicked()
{
  redraw();
}



class Die
{
  int rollNumber, diceRolls, diceValue, corner;
  float diceSize;
  Die(int d)
  {
    rollNumber = 0;
    diceRolls = 0;
    diceValue = 0;
    diceSize = d;
    corner = 10;
  }
  
  void roll()
  {
    rollNumber = (int)(Math.random() * 6 + 1);
  }
  
  void place(int x, int y)
  {
    
    translate(x, y, diceSize/2);
    
    pushMatrix();
    translate(0, 0, diceSize/2 + 1);
    noStroke();
    fill(0, 0, 50);
    if(rollNumber == 1) rotateX(0);
    
    if(rollNumber == 2)
    {
      rotateX(-PI/2);
    }
    
    if(rollNumber == 3)
    {
      rotateY(PI/2);
    }
    
    if(rollNumber == 4)
    {
      rotateY(-PI/2);
    }
    
    if(rollNumber == 5)
    {
      rotateX(PI/2);
    }
    
    if(rollNumber == 6)
    {
      rotateX(PI);
    }
    
    stroke(0, 0, 0);
    fill(0, 0, 100);
    drawDie();
    
    popMatrix();
    
    translate(-x, -y, -diceSize/2);
  }
  
  void drawDie()
  {
    
    pushMatrix();
    
    box(diceSize, diceSize, diceSize);
    
    translate(0, 0, diceSize/2); //1
    pushMatrix();
    translate(0, 0, -2);
    sphere(diceSize/10);
    popMatrix();
    
    translate(0, 0, -diceSize); //6
    pushMatrix();
    translate(0, 0, 2);
    translate(diceSize/4, diceSize/4);
    sphere(diceSize/10);
    translate(0, -diceSize/4);
    sphere(diceSize/10);
    translate(0, -diceSize/4);
    sphere(diceSize/10);
    translate(-diceSize/2, 0);
    sphere(diceSize/10);
    translate(0, diceSize/4);
    sphere(diceSize/10);
    translate(0, diceSize/4);
    sphere(diceSize/10);
    popMatrix();
    
    translate(diceSize/2, 0, diceSize/2); //2
    pushMatrix();
    translate(-2, 0);
    translate(0, diceSize/4, diceSize/4);
    sphere(diceSize/10);
    translate(0, -diceSize/2, -diceSize/2);
    sphere(diceSize/10);
    popMatrix();
    
    translate(-diceSize, 0); //5
    pushMatrix();
    translate(2, 0);
    sphere(diceSize/10);
    translate(0, diceSize/4, diceSize/4);
    sphere(diceSize/10);
    translate(0, -diceSize/2);
    sphere(diceSize/10);
    translate(0, 0, -diceSize/2);
    sphere(diceSize/10);
    translate(0, diceSize/2);
    sphere(diceSize/10);
    popMatrix();
    
    translate(diceSize/2, -diceSize/2); //3
    pushMatrix();
    translate(0, 2);
    sphere(diceSize/10);
    translate(diceSize/4, 0, diceSize/4);
    sphere(diceSize/10);
    translate(-diceSize/2, 0, -diceSize/2);
    sphere(diceSize/10);
    popMatrix();
    
    translate(0, diceSize); //4
    pushMatrix();
    translate(0, -2);
    translate(diceSize/4, 0, diceSize/4);
    sphere(diceSize/10);
    translate(-diceSize/2, 0);
    sphere(diceSize/10);
    translate(0, 0, -diceSize/2);
    sphere(diceSize/10);
    translate(diceSize/2, 0);
    sphere(diceSize/10);
    popMatrix();
    
    popMatrix();
  }
}
