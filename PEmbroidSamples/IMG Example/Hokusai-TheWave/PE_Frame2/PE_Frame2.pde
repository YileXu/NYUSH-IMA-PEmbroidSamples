
import processing.embroider.*; // import PEmbroider Lib
PEmbroiderGraphics E; // setup Lib

PGraphics PG;
PImage img;
int sizeX = 10;
int sizeY = 5;

void setup() {
  
  size(1100, 700); // max approximate (1100, 1100) // choose similar size as your img
  noLoop(); // no Loop() in PEmbroider program
  //setOutOfBoundsHandler(3);
  img = loadImage("hokusai2.jpg"); // the img you want to embroid, put it in data folder
  PG = createGraphics(width, height);
  E = new PEmbroiderGraphics(this, width, height); // setup project
  String outputFilePath = sketchPath("PEmbroider_bitmap_image_IMA.pes"); // setup output file name and path
  E.setPath(outputFilePath); // default path

  //----------------------------------------------------------------------
  render();
  embroider();

  // draw the raster graphics, for reference
  //image(PG, 0, 0);
  
  E.optimize(); // VERY SLOW, but essential for file output! 
  pushMatrix(); 
  translate(50, 0); 
  E.visualize(); // Visualize the project in canvas so able to see it while running the program
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
      // choose the part you want in img (choose a rgb-color range)
      // NOTE: You can choose 1 color range per time and do the embroid job to make multicolor work
      if (  red(img.pixels[index]) > 0 &&   red(img.pixels[index]) < 120
      &&  green(img.pixels[index]) > 0 && green(img.pixels[index]) < 255
      &&   blue(img.pixels[index]) > 0 &&  blue(img.pixels[index]) < 170) {
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

//----------------------------------------------------------------------
class MyVecField implements PEmbroiderGraphics.VectorField {
  public PVector get(float x, float y) {
    x*=0.05;
    return new PVector(1, 0.5*sin(x));
  }
}

void mousePressed() {
  saveFrame("mySketch.png"); // incase you wish to store the visualization in project folder
}
