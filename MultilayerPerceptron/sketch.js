let brain;
let trainingData= [
    {
        inputs: [0,0],
        targets: [0]
    },
    {
        inputs: [0,1],
        targets: [1]
    },
    {
        inputs: [1,0],
        targets: [1]
    },
    {
        inputs: [1,1],
        targets: [0]
    }
];
function setup() {

    createCanvas(400,400);
    brain=new NeuralNetwork(2,6,1);

}

function draw()
{
    background(0);

    for(let i=0;i<1000;i++)
    {
        let data=random(trainingData)
            brain.train(data.inputs,data.targets);
    }
    let resolution=10;
    let cols=width/resolution;
    let rows=height/resolution;

    for(let i=0;i<cols;i++)
        for(let j=0;j<rows;j++)
        {
            let y=brain.feedForward([i/cols,j/rows]);
            fill(y*255);
            noStroke();
            rect(i*resolution,j*resolution,resolution,resolution);
        }
}
