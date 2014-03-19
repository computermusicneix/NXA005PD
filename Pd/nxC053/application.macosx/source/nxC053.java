import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class nxC053 extends PApplet {

// nxC053
// Miquel Parera Jaques 
// December.2013
// License: CC-BY-SA

int d = day();    
int m = month();  
int y = year();
int h = hour();
int minut = minute();
int s = second();

float numFrames = 1;

int width = 1440;
int height = 900;

float sum = random(80,200);
float ar = random(width,width*2);
int st = PApplet.parseInt(random(10,250));
int ent = PApplet.parseInt(random(1,200));

public void setup() {
  size(width,height);
  frameRate(10);
  noCursor();
}

public void draw() {
  background(255);
  smooth();
  int i = 0;
  float radius = random(1,100);
  while (i < width) {
    radius+= sum;
    float rad = radians(i);
    i = i + 10;
    strokeWeight(random(0,st));
    noFill();
    stroke(0,0,0,random(0,255));
    ellipse(random(10,width/ent)+ (radius * sin(rad)),(height/50) + (radius * cos(rad)),ar,ar);
    //ellipse(random(10,width)+ (radius * sin(rad)),(height/50) + (radius * cos(rad)),ar,ar);
  }

  if (frameCount <= numFrames) {
  saveFrame("GRAPH-"+y+"-"+m+"-"+d+"_"+h+"-"+minut+"-"+s+"-##.jpg");
  exit();  
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "nxC053" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
