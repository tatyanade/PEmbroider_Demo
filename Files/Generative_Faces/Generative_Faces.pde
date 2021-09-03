import processing.embroider.*;

PEmbroiderGraphics E;
public void setup() {
  size(700,700);
  noLoop(); 
  
  //File setup info
  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("Generative_Face.vp3");
  E.setPath(outputFilePath);
  
  //Starts Drawing
  E.beginDraw(); 
  E.clear();
  
  //-------Your code here-----------------
  
  //--Head Shapes--
  E.stroke(0,150,0);
  E.strokeMode(E.TANGENT);
  E.strokeWeight(5);

  int ellipseHeight = 150;
  int ellipseWidth = 150;
  
  int numCols = 3;
  int numRows = 3;
  
  for (int col = 0; col < numCols; col++){
    int cx = col*(ellipseWidth + 50) + 150;
    for (int row = 0; row < numRows ; row++){
      int cy = row*(ellipseHeight + 50) + 150;
      
      float currentH = ellipseHeight * random(.8, 1.3);
      float currentW = ellipseWidth * random(.8, 1.3);
      
      E.ellipse(cx,cy, currentW, currentH);
    }
  }
  
  //Eyes
  E.stroke(0,0,150);
  E.strokeWeight(3);
   
  
  for (int col = 0; col < numCols; col++){
    int cx = col*(ellipseWidth + 50) + 150;
    for (int row = 0; row < numRows ; row++){
      int cy = row*(ellipseHeight + 50) + 150;
      
      float eyeDist = random(40, 100);
      float eye1x =  cx + eyeDist/2;
      float eye1y = cy - 10;
      float eye2x = cx - eyeDist/2;
      float eye2y = eye1y;
      
      float eyeDiameter = 25 * random(.8, 1.3);
      
      //draw Eyes
      E.circle( eye1x, eye1y, eyeDiameter);
      E.circle( eye2x, eye2y, eyeDiameter);
      
      //draw Pupils
      
      float pupilDiameter = eyeDiameter * random(.3, .8);
      
      float xOffset = (eyeDiameter - pupilDiameter)/2 * random(-1, 1);
      float yOffset = (eyeDiameter - pupilDiameter)/2 * random(-1, 1);
      
      E.circle( eye1x + xOffset, eye1y + yOffset, pupilDiameter);
      E.circle( eye2x + xOffset, eye2y + yOffset, pupilDiameter);
           
      
    }
  }
  
  
  //--Mouth--
  
  E.stroke(150,0,0);
  
    for (int col = 0; col < numCols; col++){
    int cx = col*(ellipseWidth + 50) + 150;
    for (int row = 0; row < numRows ; row++){
      int cy = row*(ellipseHeight + 50) + 150;
      
      float mouthcy = cy + random(10,50);
      
      float mouthWidth = 40;
      
      float mouth1x = cx - mouthWidth/2;
      float mouth1y = mouthcy + random(-10,10);
      float mouth2x = cx + mouthWidth/2;
      float mouth2y = mouthcy + random(-10,10);
      
      float mouthWeight = random(5, 14);
      
      E.strokeWeight(mouthWeight);
      E.strokeMode(E.PERPENDICULAR);
      E.strokeSpacing(4);
      E.line(mouth1x, mouth1y, mouth2x, mouth2y);
    }
  }
  
  //-------File saving & preview-----------
  
  E.optimize(); // slow but good and important
  E.visualize(true, true, true); 
  E.endDraw(); // write out the file
  save("Generative_Face.png");
}
