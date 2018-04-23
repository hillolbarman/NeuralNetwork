float f(float x)
  {
    return 0.3*x+0.2;
  }
class Point
{
  float x,y,bias;
  int label;
  Point()
  {
    x=random(-1,1);
    y=random(-1,1);
    bias=1;
    
    float lineY=f(x);
    if(lineY <y)
      label=1;
    else
      label=-1;
      
  }
  Point(float x,float y)
  {
    this.x=x;
    this.y=y;
    bias=1;
  }
  float pixelX()
  {
    return map(x,-1,1,0,width);
  }
  float pixelY()
  {
    return map(y,-1,1,height,0);
  }
  void show()
  {
    stroke(0);
    if(label==1)
      fill(255);
    else
      fill(0);
    float px=pixelX();
    float py=pixelY();
    ellipse(px,py,12,12);
  }
}