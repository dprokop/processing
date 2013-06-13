import java.util.*;

Random generator;
float xStandardDeviation, yStandardDeviation, xMean, yMean;
boolean randomizeSizes;
int ellipseSize;
void setup(){
  frameRate(120);
  background(255,255,255);
  size(displayWidth/2, displayHeight/2);
  xStandardDeviation = 120;
  yStandardDeviation = 120;
  xMean = displayWidth/4;
  yMean = displayHeight/4;
  generator= new Random();
  
  randomizeSizes = false;
  ellipseSize = 15;
}

void draw(){
  float xRandom = (float) generator.nextGaussian();
  float yRandom = (float) generator.nextGaussian();  
  float x = xStandardDeviation*xRandom + xMean;
  float y = yStandardDeviation*yRandom + yMean;  
  
  
  
  noStroke();
  fill((int)((float) generator.nextGaussian()*255),
        (int)((float) generator.nextGaussian()*255),
        (int)((float) generator.nextGaussian()*255), 
        (int)((float) generator.nextGaussian()*50+20)
  );
  
  if(randomizeSizes)
    ellipseSize = (int)((float) generator.nextGaussian()*10);
  else{
    int distance = (int)dist(displayWidth/4, displayHeight/4, x,y);
    
    //ellipse size based on the distance from the viewport center
    ellipseSize = (int)map(distance, 0 , (int)sqrt((displayWidth*displayWidth + displayHeight*displayHeight)/16), 2, 40);    
  }
   
  ellipse(x, y, ellipseSize, ellipseSize);
}

