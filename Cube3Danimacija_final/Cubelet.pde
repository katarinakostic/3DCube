class Cubelet{
  PMatrix3D matrix; //objekat 3d matrice
  int x=0;
  int y=0;
  int z=0;
  color c;
  //svaki cubie ima 6 face-a od kojih svaki ima normalu i boju
  Face[] faces = new Face[6];
  
  Cubelet(PMatrix3D m, int x, int y, int z){
    //pos=new PVector(x, y, z);
    matrix = m;
    this.x=x;
    this.y=y;
    this.z=z;
    c = color(255);
    
    //niz faces sadrzi sve boje lica i normalu koja oznacava njihov polozaj kada je kocka sklopljena
    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255)); //plava je pozadi
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0)); //zelena je napred
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));//white
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0)); //yellow
    faces[4] = new Face(new PVector(1, 0, 0 ), colors[2]);
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
   
  }
  
  void turnFacesZ(int dir){
    for(Face f : faces){
      f.turnZ(dir * HALF_PI);
    }
  }
  
  void turnFacesY(int dir){
    for(Face f : faces){
      f.turnY(dir * HALF_PI);
    }
  }
  
  void turnFacesX(int dir){
    for(Face f : faces){
      f.turnX(dir * HALF_PI);
    }
  }
  
  void update(int x, int y, int z){
    matrix.reset();
    matrix.translate(x, y, z);
    this.x=x;
    this.y=y;
    this.z=z;
  }
  
  void show(){
    //fill(c);
    noFill();
    //if (highlight){
    //  fill(255, 0, 0);
    //}
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix); 
    box(1);
    for (Face f : faces)
    //svaku boju lica prikazi na odg mestu
          f.show(x, y, z);
    //box(len);
    popMatrix();
  }
  
}
