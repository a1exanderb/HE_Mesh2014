import wblut.geom.*;
import wblut.processing.*;

WB_RandomPoint source;
WB_Render3D render;
WB_Point[] points;
int numPoints;
WB_Sphere sphere;
void setup(){
 size(800,800,P3D);
 source=new WB_RandomBox().setSize(500,300,200);
 render=new WB_Render3D(this);
 numPoints=20;
 points=new WB_Point[numPoints];
  for(int i=0;i<numPoints;i++){
   points[i]=source.nextPoint();
 }
 sphere=WB_Sphere.getBoundingSphere(points);
 noFill();
}


void draw(){
 background(255);
 directionalLight(255, 255, 255, 1, 1, -1);
 directionalLight(127, 127, 127, -1, -1, 1);
 translate(width/2, height/2, 0);
 rotateY(mouseX*1.0f/width*TWO_PI);
 rotateX(mouseY*1.0f/height*TWO_PI);
 stroke(255,0,0);
 render.drawPoint(points,5);
 stroke(0);
 render.translate(sphere.getCenter());
 sphere((float)sphere.getRadius());
  
}