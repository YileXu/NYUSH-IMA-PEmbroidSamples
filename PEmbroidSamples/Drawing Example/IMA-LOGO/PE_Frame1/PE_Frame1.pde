
import processing.embroider.*; // import PEmbroider Lib
PEmbroiderGraphics E; // setup Lib

void setup() {
  
  size(800, 800); // max approximate (1100, 1100)
  noLoop(); // no Loop() in PEmbroider program
  E = new PEmbroiderGraphics(this, width, height); // setup project
  String outputFilePath = sketchPath("IMA-LOGO.pes"); // setup output file name and path
  E.setPath(outputFilePath); // default path
  E.beginDraw(); // starting up
  E.clear(); // clear the canvas
  
  // Here is your drawing space
  //
  //
  //
  //
  //
  //
  //
  
  // NOTE: Leave optimize() and endDraw() commented out until you are ready to export!
  //
  // E.optimize(); // VERY SLOW, but essential for file output! 
  E.visualize(); // Visualize the project in canvas so able to see it while running the program
  // E.endDraw(); // Write out the embroidery file 
}

void mousePressed() { 
  saveFrame("mySketch.png"); // incase you wish to store the visualization in project folder
}
