//<>
int Height, Width;
int blkWdth =70 ;
int blkLen = 15;

class Ball {
  float x= random (0, width);
  float y= random (height/3, height);
  int size;
  float speedx = 5;
  float speedy = 3;

  Ball(int Size) {

    size = Size ;
  }  


  void Draw() {
    fill(#FA2D2D);
    ellipse(x, y, size, size);
  }  




  void Bounce() {

    if (x<0 || x > width) {
      speedx = -speedx;
    }
    if (y<0 ) {
      speedy = -speedy;
    }
    if ((y+10 >=mouseY-(Height/2) && y+10 <=mouseY+(Height/2))) {  
      if ((x>=mouseX-(Width/2)&& x <=mouseX+(Width/2))) {
        speedy = -speedy;
      }
    }
  }


  void Move() {
    x= x+ speedx ;
    y= y+ speedy;
  }
}




class Rect {

  Rect(int w, int h) {

    Width = w ;  
    Height = h ;
  }
  void Draw() {
    fill(255);
    rect(mouseX-(Width/2), mouseY-(Height/2), Width, Height);
  }
}





class Block {
  
float R,G,B;
float x;
float y;
boolean state = true ;

Block(float r,float g,float b){
R = r ;
G = g ;
B = b ;
}

  void Draw(int X,int Y) {  
 if(state){ 
  fill(R,G,B);
  
  rect(X,Y,blkWdth,blkLen);
  x =X;
  y =Y;}
  
  }
}
