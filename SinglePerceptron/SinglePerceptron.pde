Perceptron brain;
Point[] points=new Point[100];

void setup()
{
  size(500,500);
  
  brain=new Perceptron();
  
  //Training data
  for(int i=0;i<points.length;i++)
    points[i]=new Point();
    
    
  float[] inputs={-1,0.5};
}

void draw()
{
  background(150);
  
  //Training data
  stroke(0);
  line(0,0,width,height);
  for(Point p:points)
    p.show();
  
  for(Point p:points)
  {
    float[] inputs={p.x,p.y};
    
    int guess=brain.guess(inputs);
    if(guess==p.lable)
      fill(0,255,0);
    else
      fill(255,0,0);
    noStroke();
    ellipse(p.x,p.y,7,7);
  }
}

void mousePressed()
{
  for(Point p:points)
  {
    float[] inputs={p.x,p.y};
    brain.train(inputs,p.lable);
  }
}