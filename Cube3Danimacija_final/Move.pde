class Move{
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir=0;
  float speed=0.15;
  boolean animating = false;
  boolean finished = false;
  
  Move(int x, int y, int z, int dir){
    this.x=x;
    this.y=y;
    this.z = z;
    this.dir=dir;
  }
  
  Move reverse(){
    return new Move(x, y, z, dir*(-1));
  }
  
  //void reverse(){ dir *= -1;}
  
  void start(){
    animating=true;
    finished=false;
    this.angle=0;
  }
  
  boolean finished(){
    return finished;
  }
  
  void update(){
    if(animating){
    angle += dir * speed;
    if(abs(angle)>HALF_PI){
      angle=0;
      animating=false;
      finished = true;
      if(abs(x)>0){
        turnX(x, dir);}
      else if (abs(z)>0){
        turnZ(z, dir);}
      else if (abs(y)>0){
        //println(y);
        turnY(y, dir);
      }
    }}}
  }
