class Face{
// svaki cubie ima 6 lica-- svih 6 bojimo
//svaki cubie ce da ima vektor, njegova normala nam pokazuje sa koje je strane -
//npr. (0, 0, 1) je na front strani, pokazuje u pozitivnom smeru z ose

  PVector normal;
  color c;
  
  Face(PVector normal, color c){
    this.normal = normal;
    this.c = c;
  }
  

//rotiranje normale po x osi  
  void turnZ(float angle){
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.y*sin(angle));
    v2.y = round(normal.x * sin(angle) + normal.y*cos(angle));
    v2.z = round(normal.z);
    normal = v2;
  }
   void turnX(float angle){
    PVector v2 = new PVector();
    v2.x = round(normal.x);
    v2.y = round(normal.y * cos(angle) - normal.z*sin(angle));
    v2.z = round(normal.y * sin(angle) + normal.z*cos(angle));
    normal = v2;
    
  }
  void turnY(float angle){
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.z*sin(angle));
    v2.z = round(normal.x * sin(angle) + normal.z*cos(angle));
    v2.y = round(normal.y);
    normal = v2;
    
  }
  
  void changeColor(){
    this.c=color(255,255,255);
  }
  
  void show(int x1, int y1, int z1){
    pushMatrix();
    if(normal.z==1){
      if(z1 == 1){
        fill(c);
      } else fill(255, 255, 255);
    }
    if(normal.z == -1){
      if(z1 == -1){
        fill(c);
      } else fill(255, 255, 255);
    }
    if (normal.x == 1){
      if(x1 == 1){
        fill(c);
      } else fill(255, 255, 255);
    }
    if (normal.x == -1){
      if(x1 == -1){
        fill(c);
      } else fill(255, 255, 255);
    }
    if (normal.y == 1){
      if(y1 == 1){
        fill(c);
      } else fill(255, 255, 255);
    }
    if (normal.y == -1){
      if(y1 == -1){
        fill(c);
      } else fill(255, 255, 255);
    }
    //fill(c);
    rectMode(CENTER);
    //square(0, 0, 1);
    translate(0.5*normal.x, 0.5*normal.y, 0.5*normal.z);
    if(abs(normal.x)>0)
      rotateY(HALF_PI);
    else if(abs(normal.y)>0)
      rotateX(HALF_PI);
    square(0, 0, 1);
    popMatrix();
  }

}
