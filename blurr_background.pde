PImage img;
  int b[]={1,-1,0,0,1,1,-1,-1};
  int c[]={0,0,1,-1,1,-1,1,-1};
  color[][][] o = new int[1000][400][3];
  
void setup(){
  size(1000,1000);
   img = loadImage("lion.jpg");
   background(255);
}  
void draw(){
  loadPixels();
  int a = 15;
  int[][] k = new int[1000][400];
 // int[][] g = new int[1000][400];

  img.loadPixels();
   for (int x=1;x<999;x++){
    for (int y=1;y<399 ; y++){
     int loc1 = x+y*width; 
   //  float b1= brightness(img.pixels[loc1]); 
   for(int i=0;i<8;i++){
     
     if(red(img.pixels[loc1-c[i]])< red(img.pixels[loc1-b[i]])-a){k[x][y]++;k[x+c[i]][y+b[i]]++;}
     if(red(img.pixels[loc1-c[i]])> red(img.pixels[loc1-b[i]])+a){k[x][y]++;k[x+c[i]][y+b[i]]++;}
     if( green(img.pixels[loc1-c[i]])<green(img.pixels[loc1-b[i]])-a ){k[x][y]++;k[x+c[i]][y+b[i]]++;}
     if(green(img.pixels[loc1-c[i]])>green(img.pixels[loc1-b[i]])+a){k[x][y]++;k[x+c[i]][y+b[i]]++;}
     if(blue(img.pixels[loc1-c[i]])< blue(img.pixels[loc1-b[i]])-a ){k[x][y]++;k[x+c[i]][y+b[i]]++;}
     if(blue(img.pixels[loc1-c[i]])> blue(img.pixels[loc1-b[i]])+a){k[x][y]++;k[x+c[i]][y+b[i]]++;}
       //println(a);
     } 
      for(int i=0;i<4;i++){
        if(k[x+c[2*i]][y+b[2*i]] > k[x][y] && k[x+c[1+i]][y+b[1+i]] > k[x][y]){
           k[x][y] = max(k[x+c[2*i]][y+b[2*i]],k[x+c[1+i]][y+b[1+i]]);
           
         }   
      }
      
     blur(k,x,y);
     //float w = map(k[x][y],5,21,255,120);
    // println(o[x][y][0]);
     pixels[loc1] = color(o[x][y][0],o[x][y][1],o[x][y][2],15);
   }
 } 
  updatePixels();
  //save("lion1.jpg");
} 

void blur(int a[][],int x ,int y){
   
  if(a[x][y] < 5){
    for (int i=0;i<8;i++){
    o[x][y][0] =+int(red(img.pixels[x+c[i]+(y+b[i])*width]));
    o[x][y][1] =+int(green(img.pixels[x+c[i]+(y+b[i])*width]));
    o[x][y][2] =+int(blue(img.pixels[x+c[i]+(y+b[i])*width]));}  
    //println(o[x][y][0]);
    o[x][y][0]=o[x][y][0];
    o[x][y][1]=o[x][y][1];
    o[x][y][2]=o[x][y][2];
  }
  else{
    o[x][y][0] =+int(red(img.pixels[x+(y)*width]));
    o[x][y][1] =+int(green(img.pixels[x+(y)*width]));
    o[x][y][2] =+int(blue(img.pixels[x+(y)*width]));} 
  }
