class Perceptron
{
  float[] weights;
  float learningRate=0.01;
  
  //Constructor
  Perceptron(int n)
  {
    weights=new float[n];
    //Initialize weights randomly
    for(int i=0;i<weights.length;i++)
      weights[i]=random(-1,1);
  }
  //Activation function
  int sign(float n)
  {
    if(n<0)
      return -1;
    else
      return 1;
  }
  //Guess
  int guess(float[] inputs)
  {
    float sum=0;
    for(int i=0;i<inputs.length;i++)
      sum+=inputs[i]*weights[i];
     
    int output=sign(sum);
    return output;
  }
  float guessY(float x)
  {
    return -(weights[2]/weights[1])-(weights[0]/weights[1])*x;
  }
  void train(float[] inputs,int target)
  {
    int guess=guess(inputs);
    int error=target-guess;
    
    //Tune all the weights
    for(int i=0;i<weights.length;i++)
    {
      weights[i]+=error*inputs[i]*learningRate;
    }
  }
}