int Score =0 ;
int BestScore ;
Rect r1 ;
Ball b1 ;
Block[][] block;
Table data;
TableRow row ;

void setup(){

size(700,400,P2D);
background(0);
r1 = new Rect(80,20);
b1 = new Ball(25);


//------------ Loading the Score data ---------------

loadData();


//---------initializing the blocks objects -------------


block = new Block[(width/blkWdth)][6];
  for (int i = 0; i<(width/blkWdth); i++) {
    for (int j = 0; j<6; j++) {
  block[i][j] = new Block(0,234,245);}}

}

void draw(){
  
background(0);
//----------------- Losing Window -----------------
if (b1.y >height) {
  
  if(Score > BestScore){row.setInt("BestScore",Score);}
  
  
      background(0);
      fill(255);
     PFont f = createFont("NimbusRoman-Regular",48);
      textFont(f);
      textSize(48);
      textAlign(CENTER);
      text("YOU LOST!",width/2,height/3);
      textSize(25);
      fill(155);
      textFont(createFont("NimbusRoman-Regular",25));
      text("press any key to restart",width/2,2*height/3);
      fill(#310395);
      text("Score: "+Score,width/2, height/2);
      text("Best Score: "+BestScore,width/2,height/2+20);
  
// ----------- playing Window ---------------      
    }else{
b1.Draw();
r1.Draw();
// ------------drawing the blocks-------------
   int a = 0;
   int b = 0;

  for (int i = 0; i<width; i+=blkWdth) {
    b = 0 ;
    for (int j = 0; j<6*blkLen; j+=blkLen) { 
      block[a][b].Draw(i, j);
    b++;} 
    a++;}


// ---- incresing the difficulty by time ------

b1.speedx*=1.0001;
b1.speedy*=1.0001;

//--------------- Ball movment -----------------

b1.Move();
b1.Bounce();


//------ Clearing the blocks at overlaps -------

for (int i = 0; i<(width/blkWdth); i++) {
  for (int j = 0; j<6; j++) {
if (ballOverlaps(i,j)){
block[i][j].state= false ;
b1.speedy = -b1.speedy; // to bounce the ball after the overlap
block[i][j].y = height;

Score++;

}}}


 }
saveData();
loadData();


}

//function for detecting the overlaping between the ball and the blocks


boolean ballOverlaps(int i,int j){
  
if (dist(b1.x,b1.y,(block[i][j].x+blkWdth/2),(block[i][j].y+blkLen/2)) <= 36){

 


 if (b1.y<=  blkLen && block[i][j].y == 0){  return true;}
 if (b1.y<=2*blkLen && block[i][j].y == 15 ){  return true;}
 if (b1.y<=3*blkLen && block[i][j].y == 30){  return true;}
 if(b1.y<=4*blkLen && block[i][j].y == 45){  return true;}
 if (b1.y<=5*blkLen && block[i][j].y == 60){  return true;}
 if(b1.y<=6*blkLen && block[i][j].y == 75){  return true;}

else return false;} else return false ;

}

void keyTyped(){

Restart();}


void Restart(){
 int a = 0;
   int b = 0;

  for (int i = 0; i<width; i+=blkWdth) {
    b = 0 ;
    for (int j = 0; j<6*blkLen; j+=blkLen) { 
      block[a][b].x = i;
      block[a][b].y = j;
      block[a][b].state = true;
      block[a][b].state = true;
    b++;} 
    a++;
 }
 
 b1.speedx =5;
 b1.speedy =3;
 b1.y = 6*blkLen +5 ;
 
 Score = 0 ;
}

void loadData(){
data = loadTable("data.csv","header");
row = data.getRow(0);
BestScore = row.getInt("BestScore");
}

void saveData(){
saveTable(data ,"data/data.csv");
data.setRow(0,row);
}
