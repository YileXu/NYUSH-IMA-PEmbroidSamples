
// Example PEmbroider program 
// Created by IMA Studio Assistant - Yile Xu - contact xy1242@nyu.edu if you have any question

import processing.embroider.*;
PEmbroiderGraphics E;

void setup() {
  
  // Starting up:
  noLoop();
  size(800, 800);
  E = new PEmbroiderGraphics(this, width, height); 
  String outputFilePath = sketchPath("IMA-LOGO.pes"); 
  E.setPath(outputFilePath);
  E.beginDraw(); 
  E.clear();
  
  //----------------------------------------------------------------------
  // Circles goes here: 
  E.fill(0, 0, 0);
  E.noFill();
  E.stroke(0);
  E.strokeWeight(25); 
  E.strokeSpacing(3);
  E.ellipseMode(CENTER);
  E.strokeMode(PEmbroiderGraphics.PERPENDICULAR);
  E.setStitch(10, 50, 0); 
  E.ellipse(400, 400, 600, 600);
  E.strokeWeight(10);
  E.ellipse(400, 400, 500, 500);
  
  //----------------------------------------------------------------------
  // Message goes here: 
  String message1 = "INTERACTIVE MEDIA ARTS";
  String message2 = "NYU SHANGHAI";
  float r = 200;
  
  E.textFont(PEmbroiderFont.DUPLEX);
  E.textSize(1.8);
  E.textAlign(CENTER);
  E.setStitch(10, 30, 0); 
  // smooth();
  E.translate(width / 2, height / 2);
  E.noFill();
  E.stroke(0);
  // E.ellipse(0, 0, r*2, r*2); // for assistance
  // Decide the beginning arclength
  float arclength = -75;
  for (int i = 0; i < message1.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message1.charAt(i);
    String currentChar1 = str(currentChar);
    float w = 35;
    // Each box is centered so we move half the width
    arclength += w/2;
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;
    E.pushMatrix();
    E.beginComposite();
    // Polar to cartesian coordinate conversion
    E.translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    E.rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    E.fill(0,0,0);
    E.text(currentChar1,0,0);
    E.endComposite();
    E.popMatrix();
    // Move halfway again
    arclength += w/2;
  }
  // Reset the arclength
  arclength = -80;
  for (int i = 0; i < message2.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message2.charAt(i);
    String currentChar1 = str(currentChar);
    float w = 35;
    // Each box is centered so we move half the width
    arclength -= w/2;
    if (i==0) { arclength -= w; }
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;
    E.pushMatrix();
    E.beginComposite();
    // Polar to cartesian coordinate conversion
    E.translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    E.rotate(theta+PI/2+PI); // rotation is offset by 90 degrees
    // Display the character
    E.fill(0,0,0);
    E.text(currentChar1,0,0);
    E.endComposite();
    E.popMatrix();
    // Move halfway again
    arclength -= w/2;
  }
  
  //----------------------------------------------------------------------
  // Graphic goes here:
  E.fill(0, 0, 0); // dots
  E.ellipse( 85,  -40, 8, 8); 
  E.ellipse(-85,  -40, 8, 8); 
  E.ellipse( 75,  -90, 8, 8); 
  E.ellipse(-75,  -90, 8, 8); 
  E.ellipse( 35, -130, 8, 8); 
  E.ellipse(-35, -130, 8, 8); 
  E.noFill(); // lines
  E.arc(0, -60, 100, 100, PI, 2*PI);
  E.line(-50, -10, -50, -50); // up-left
  E.line( 50, -10,  50, -50); // up-right
  E.line(-70,  0, 70,  0); // up
  E.line(-70, 20, 70, 20); // bottum
  E.line(-35, 30, -35,  90); // bottum-left
  E.line( 40, 30,  40, 150); // bottum-right
  
  E.fill(0, 0, 0);
  E.stroke(0,0,0);
  E.beginShape(); // left
  E.vertex(0, -10);
  E.vertex(-30, -10);
  E.vertex(-30, -30);
  E.vertex(-20, -30);
  E.endShape(CLOSE);
  E.beginShape(); // right
  E.vertex( 20, -10);
  E.vertex(  0, -30);
  E.vertex( 30, -30);
  E.vertex( 30, -10);
  E.endShape(CLOSE);
  
  //----------------------------------------------------------------------
  // Visualization and export:
  // NOTE: Leave optimize() and endDraw() commented out
  // until you are ready to export!
  //
  // E.optimize(); // VERY SLOW, but essential for file output! 
  E.visualize();
  // E.endDraw(); // Write out the embroidery file 
}

void mousePressed() { 
  saveFrame("mySketch.png"); // incase you wish to store the visualization in project folder
}
