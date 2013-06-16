import java.util.*;

Random generator;

boolean randomizeSizes;
int ellipseSize;

void setup() {
  
  background(255,255,255);
  size(displayWidth/2, displayHeight/2);

  generator= new Random();

  randomizeSizes = false;
  ellipseSize = 15;
}
void mouseDragged() {
  //speed is determined by the distance between previous and current mouse position
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  //the speed is mapped to the alpha of the rectangle to be added
  //to blur out the previous drawing
  float alpha = map(speed, 0, 20, 0, 10);
  
  //semitransparent rectangle is being drawn
  noStroke();
  fill(255, alpha);
  rect(0, 0, width, height);
  
  //distance from center of the viewport
  int distance = (int)dist(displayWidth/4, displayHeight/4, mouseX, mouseY);
  
  //distance is being mapped to the density of the brush (the Gaussians distribution standard deviation)
  int density = (int)map(distance, 0, (int)sqrt((displayWidth*displayWidth + displayHeight*displayHeight)/16), 20, 1);
  
  gaussianBrush(mouseX, mouseY, density);
}

void draw() {
 
}



void gaussianBrush(float xPos, float yPos, int density) {
   
  for(int i=0; i< density*10; i++){
    float xRandom = (float) generator.nextGaussian();
    float yRandom = (float) generator.nextGaussian(); 
   
    //calculating the current ellipse position 
    float x = density*xRandom + xPos;
    //and its reflected position
    float rX = width-x;
    float y = density*yRandom + yPos;
    float rY = height-y;
   
    noStroke();
    
    //some random color
    fill((int)((float) generator.nextGaussian()*255), 
          (int)((float) generator.nextGaussian()*255), 
          (int)((float) generator.nextGaussian()*255), 
          (int)((float) generator.nextGaussian()*50+20)
    );
   
    ellipse(x, y, density, density);
    ellipse(rX,rY, density, density);
  }
  return;
}

