import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh, slicedMesh;
WB_Render render;
WB_Plane[] planes;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  createMesh();
  
  HEM_MultiSlice modifier=new HEM_MultiSlice();
  planes=new WB_Plane[5];
  for(int i=0;i<5;i++){
    int pol=(random(100)<50)?-1:1;
  planes[i]=new WB_Plane(random(-20,20),random(-20,20),-pol*random(50,150),pol*random(1),pol*random(1),pol*random(1));
  } 
  modifier.setPlanes(planes);// Cut plane 
  //planes can also be any Collection<WB_Plane>
  modifier.setOffset(0);// shift cut plane along normal
  modifier.setSimpleCap(false);
  slicedMesh.modify(modifier);
  
  render=new WB_Render(this);
}

void draw() {
  background(120);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(0.25*TWO_PI);
  fill(255);
  noStroke();
  for(int i=-1;i<5;i++){
 fill(255-(i+1)*60,255,(i+1)*40);
 HE_Selection faces=HE_Selection.selectFacesWithInternalLabel(slicedMesh,i);
    render.drawFaces(faces);//Multislice internally labels all faces with the index of the corresponding cutplane, -1 for part of an original face
  }
  noFill();
  stroke(0);
  render.drawEdges(mesh);
  stroke(255,0,0);
  for(int i=0;i<5;i++){
  render.drawPlane(planes[i],400);
  }

}


void createMesh(){
  HEC_Torus creator=new HEC_Torus(80, 200, 6, 16);
  mesh=new HE_Mesh(creator);
  creator=new HEC_Torus(40, 200, 6, 16);
  HE_Mesh inner=new HE_Mesh(creator);
  inner.flipFaces();
  mesh.add(inner);
  slicedMesh=mesh.get();
}