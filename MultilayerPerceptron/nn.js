function sigmoid(x)
{
    return 1/(1+Math.exp(-x));
}
function dsigmoid(y)
{
    //return sigmoid(x)*(1-sigmoid(x));
    return y*(1-y);
}
class NeuralNetwork
{
    //let inputNodes,hiddenNodes,outputNodes;
    constructor(inputNodes,hiddenNodes,outputNodes)
    {
        this.inputNodes=inputNodes;
        this.hiddenNodes=hiddenNodes;
        this.outputNodes=outputNodes;

        this.weightsIH=new Matrix(hiddenNodes,inputNodes);
        this.weightsHO=new Matrix(outputNodes,hiddenNodes);
        this.weightsIH.randomize();
        this.weightsHO.randomize();

        this.biasH=new Matrix(hiddenNodes,1);
        this.biasO=new Matrix(outputNodes,1);
        this.biasH.randomize();
        this.biasO.randomize();
        this.learningRate=0.2;
    }

    feedForward(input)
    {
        //Generating hidden outputs
        let inputs=Matrix.fromArray(input);
        let hidden=Matrix.multiply(this.weightsIH,inputs);
        hidden.add(this.biasH);
        //Activation function
        hidden.map(sigmoid);

        //Generating Ultimate outputs
        let output=Matrix.multiply(this.weightsHO,hidden);
        output.add(this.biasO);
        //Activation function
        output.map(sigmoid);

        return output.toArray();
    }

    train(inputs, targets)
    {
        //Generating hidden outputs
        inputs=Matrix.fromArray(inputs);
        let hidden=Matrix.multiply(this.weightsIH,inputs);
        hidden.add(this.biasH);
        //Activation function
        hidden.map(sigmoid);

        //Generating Ultimate outputs
        let outputs=Matrix.multiply(this.weightsHO,hidden);
        outputs.add(this.biasO);
        //Activation function
        outputs.map(sigmoid);



        targets=Matrix.fromArray(targets);
        //Calculate error: Error=targets-outputs
        let outputErrors=Matrix.subtract(targets,outputs);

        //Calculate gradients
        let gradients=Matrix.map(outputs,dsigmoid);
        gradients.multiply(outputErrors);
        gradients.multiply(this.learningRate);

        // Calculate deltas
        let weightsHO_D=Matrix.multiply(gradients,Matrix.transpose(hidden));

        // Adjust weights by deltas
        this.weightsHO.add(weightsHO_D);
        // Adjust weights by deltas
        this.biasO.add(gradients);

        //Calculate hidden layer errors
        let hiddenErrors=Matrix.multiply(Matrix.transpose(this.weightsHO),outputErrors);
        let hiddenGradient=Matrix.map(hidden,dsigmoid);
        hiddenGradient.multiply(hiddenErrors);
        hiddenGradient.multiply(this.learningRate);
        let weightsIH_D=Matrix.multiply(hiddenGradient,Matrix.transpose(inputs));
        this.weightsIH.add(weightsIH_D);
        this.biasH.add(hiddenGradient);

    }
}
