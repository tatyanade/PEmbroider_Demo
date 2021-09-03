import processing.embroider.*;

PEmbroiderGraphics E;
public void setup() {
  size(700,700);
  //Initialize file
  noLoop(); 
  
  //File setup info
  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("File_Name.vp3");
  E.setPath(outputFilePath);
  
  //Starts Drawing
  E.beginDraw(); 
  E.clear();
  
  //-------Your code here-----------------
  
  
  //-------File saving & preview-----------
  
  //E.optimize(); // slow but good and important
  //E.visualize(true, true, true); 
  E.endDraw(); // write out the file
  //save("File_Name.png");
}
