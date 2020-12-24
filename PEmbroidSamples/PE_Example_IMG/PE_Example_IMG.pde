
// Example PEmbroider program 
// Created by IMA Clinical Instructor of Arts - Marcela Godoy

import processing.embroider.*;
PEmbroiderGraphics E;
PGraphics PG;

PImage img;
int sizeX = 10;
int sizeY = 5;
int blue = 170;
int red = 120;

void setup() {
  size(1100, 700);
  noLoop(); 
  //setOutOfBoundsHandler(3);
  img = loadImage("hokusai2.jpg");
  PG = createGraphics(1050, 700);
  // Create and configure the PEmbroider object, E
  E = new PEmbroiderGraphics(this, 1010, 680);
  String outputFilePath = sketchPath("PEmbroider_bitmap_wave.pes");
  E.setPath(outputFilePath); 

  //-------------------
  render();
  embroider();

  // draw the raster graphics, for reference
  //image(PG, 0, 0);


  E.optimize(); // VERY SLOW, but essential for file output! 
  pushMatrix(); 
  translate(50, 0); 
  E.visualize();
  popMatrix(); 
  E.endDraw();  // Write out the embroidery file
}

void draw() {
}

void render() {
  PG.beginDraw();
  PG.background(0);
  PG.noStroke();

  for (int i=0; i<img.width; i=i+sizeX) {
    for (int j=0; j<img.height; j=j+sizeY) {
      // draw a circle with the color
      int index  = i+ j*img.width;
      if (blue(img.pixels[index]) < blue && red(img.pixels[index]) < red) {
        //E.hatchAngle(0);
        PG.fill(255);
        PG.rectMode(CENTER);
        PG.ellipse(i, j, sizeX*2, sizeY*2);
      }
    }
  }
  PG.endDraw();
}

void embroider() {
  // Initial setup of PEmbroider object.
  E.beginDraw(); 
  E.clear();
  E.noStroke();
  E.fill(0, 0, 0);
  MyVecField mvf = new MyVecField();
  E.HATCH_MODE = PEmbroiderGraphics.VECFIELD;
  E.HATCH_VECFIELD = mvf;
  E.HATCH_SPACING = 10;
  E.HATCH_SCALE = 4.5;
  E.hatchRaster(PG, 0, 0);
  E.hatchRaster(PG, 0, 5);
}

//--------------------------------------------
class MyVecField implements PEmbroiderGraphics.VectorField {
  public PVector get(float x, float y) {
    x*=0.05;
    return new PVector(1, 0.5*sin(x));
  }
}

void mousePressed() { 
  saveFrame("mySketch.png"); // incase you wish to store the visualization in project folder
}
