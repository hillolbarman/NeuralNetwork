class Point
{
  float x,y;
  int lable;
  Point()
  {
    x=random(width);
    y=random(height);
    
    if(x<y)
      lable=1;
    else
      lable=-1;
      
  }
  void show()
  {
    stroke(0);
    if(lable==1)
      fill(255);
    else
      fill(0);
    ellipse(x,y,12,12);
  }
}