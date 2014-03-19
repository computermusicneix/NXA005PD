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
int st = int(random(10,250));
int ent = int(random(1,200));

void setup() {
  size(width,height);
  frameRate(10);
  noCursor();
}

void draw() {
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
