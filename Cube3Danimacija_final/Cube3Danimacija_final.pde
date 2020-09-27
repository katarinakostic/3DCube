import peasy.*;
PeasyCam cam;

color[] colors =  {
  #FFFFFF, #FFFF00,
  #FFA500, #FF0000, 
  #00FF00, #0000FF
};

int dim=3;
Cubelet[] cube= new Cubelet[dim*dim*dim];

Move[] allMoves={
  new Move(0, 1, 0, 1), //Down cw
  new Move(0, 1, 0, -1), //Down cc
  new Move(0, -1, 0, 1), //UP cw
  new Move(0, -1, 0, -1), //UP cc
  new Move(1, 0, 0, 1), //RIGHT cw
  new Move(1, 0, 0, -1), //RIGHT cc
  new Move(0, 1, 0, 1), //LEFT cw
  new Move(0, 1, 0, -1), //LEFT cc
  new Move(0, 0, 1, 1), //FRONT cw
  new Move(0, 0, 1, -1), //FRONT cc
  new Move(0, 0, -1, 1), //BACK cw
  new Move(0, 0, -1, -1), //BACK cc
};

ArrayList<Move> sequence=new ArrayList<Move>();
int counter = 0;
boolean started=false;
//Move m; 

Move currentMove;

void setup(){
  size(600, 600, P3D); //P3D renderer
  
  cam = new PeasyCam(this, 400);
  
  int index=0;
  
  for(int x=-1; x<=1; x++)
    for(int y=-1; y<=1; y++)
     for(int z=-1; z<=1; z++){
       //float len=50;  
       PMatrix3D matrix = new PMatrix3D();
       matrix.translate(x, y, z);
       cube[index] = new Cubelet(matrix, x, y, z);
       index++;
     } 
     //cube[0].c=color(255, 0, 0);
     //cube[2].c=color(0, 0, 255);
     //turnZ();
     
     for(int i=0;i<50;i++){
     
       int r=int(random(allMoves.length));
       Move m = allMoves[r];
       sequence.add(m);  //dodaj 10 random pokreta
     }
     currentMove=sequence.get(counter);
     for (int i=0;i<50;i++){
     print(sequence.get(i));}
     for(int i=sequence.size()-1 ;i>=0; i--){
         Move nextMove = sequence.get(i).reverse();
         sequence.add(nextMove);
   }
     
   //  println(sequence);
     //m=new Move(0,1,0,1);
     //m.start();
}


void turnX(int index, int dir){
  for ( int i = 0;  i< cube.length; i++){
  Cubelet qb = cube[i];
    if(qb.x==index){
     
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.y, qb.z);
      
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX(dir);
    }
}}

void turnY(int index, int dir){
  for ( int i = 0;  i< cube.length; i++){
  Cubelet qb = cube[i];
    if(qb.y == index){
     
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.x, qb.z);
      
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY(dir);
    }
}}

void turnZ(int index, int dir){
  for ( int i = 0;  i< cube.length; i++){
  Cubelet qb = cube[i];
    if(qb.z==index){
      //println(qb.x, qb.y);
      //PMatrix2D matrix1 = new PMatrix2D();
      //matrix1.translate(qb.x, qb.y);
      //matrix1.print();
      
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.x, qb.y);
      
    
      //x y i z su int a vrednosti u matrici su float, koristimo round umesto kastovanju u int
      //jer ako je npr vrednost 0.999 castovanje bi nam dalo 0 a mi hoemo 1
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
      //matrix2.print();
      //println("--------");
      qb.turnFacesZ(dir); 
    }
}}

void draw(){
  background(51);
  fill(255);
  textSize(32);
  text(counter, -150, -150);
  
  scale(50);
  rotateX(-0.3);
  rotateY(0.4);
  rotateZ(0.1);
  
  
  //if (started){
    currentMove. update();   
      if (currentMove.finished()){
        if(counter<sequence.size()-1){
          counter++;
          currentMove=sequence.get(counter);
          currentMove.start();
        }}
 //}
  
//  if (started){
//      if (frameCount % 2 == 0 ) 
//      if(counter<sequence.length()){
//        char move = sequence.charAt(counter);
//        applyMove(move);
//        counter++;
//      }    
//}
  
  for(int i=0; i<cube.length; i++){
    push();
     if(abs(cube[i].x)>0 && cube[i].x == currentMove.x){
       rotateX(currentMove.angle);
     } else if(abs(cube[i].z)>0 && cube[i].z == currentMove.z)
     {
       rotateZ(currentMove.angle);
     } 
     else if(abs(cube[i]. y)>0 && cube[i].y == currentMove.y)
     {
       rotateY(-currentMove.angle);
     }
      cube[i].show();
     pop();
  }
}
