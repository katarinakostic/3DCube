void keyPressed(){
  //INDEXI SU -1, 0, 1
  //ne rotiramo ovu u sredini
  if (key == ' '){
    
    currentMove.start();
    counter = 0;
    //started = true;
  }
  
  switch(key)
  {
    case 'f':
      turnZ(1,1);
      break;
    case 'F':
     turnZ(1,-1);
      break;
    case 'b':
      turnZ(-1, 1);
      break;
    case 'B':
      turnZ(-1, -1);
      break;
    case 'u':
      turnY(-1, 1);
      break;
    case 'U':
      turnY(-1, -1);
      break;
    case 'd':
      turnY(1, 1);
      break;
    case 'D':
      turnY(1, -1);
      break;  
    case 'l':
      turnX(-1, 1);
      break;
     case 'L':
      turnX(-1, -1);
      break;  
    case 'r':
      turnX(1, 1);
      break;
    case 'R':
      turnX(1, -1);
      break;  
  }  
  //}
  
  //if(key=='1')
  //  turnZ(-1);
  // else if (key=='2')
  //   turnZ(1);
  // else if(key=='3')
  //   turnX(-1);
} 
