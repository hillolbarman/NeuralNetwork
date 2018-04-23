Perceptron brain;
Point[] points=new Point[100];
int trainingIndex=0;

void setup()
{
  size(500,500);
  
  brain=new Perceptron(3);
  
  //Training data
  for(int i=0;i<points.length;i++)
    points[i]=new Point();
}

void draw()
{
  background(150);
  
  //Training data
  stroke(0);
  //line(0,height,width,0);
  Point p1=new Point(-1,f(-1));
  Point p2=new Point(1,f(1));
  line(p1.pixelX(),p1.pixelY(),p2.pixelX(),p2.pixelY());
  
  p1=new Point(-1,brain.guessY(-1));
  p2=new Point(1,brain.guessY(1));
  line(p1.pixelX(),p1.pixelY(),p2.pixelX(),p2.pixelY());
  
  for(Point p:points)
    p.show();
  
  for(Point p:points)
  {
    float[] inputs={p.x,p.y,p.bias};
    
    int guess=brain.guess(inputs);
    if(guess==p.label)
      fill(0,255,0);
    else
      fill(255,0,0);
    noStroke();
    ellipse(p.pixelX(),p.pixelY(),7,7);
  }
  
  Point training =points[trainingIndex];
  float[] inputs={training.x,training.y,training.bias};
  brain.train(inputs,training.label);
  trainingIndex++;
  if(trainingIndex==points.length)
    trainingIndex=0;
}

void mousePressed()
{
  for(Point p:points)
  {
  }
}