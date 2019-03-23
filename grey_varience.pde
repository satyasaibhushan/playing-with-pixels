PImage img;
void setup(){
  size(1000,1000);
   img = loadImage("lion.jpg");
}  
void draw(){
  loadPixels();
  img.loadPixels();
   for (int x=0;x<1000;x++){
    for (int y=0;y<400 ; y++){
     int loc1 = x+y*width; 
     float b1= brightness(img.pixels[loc1]); 
   
     if(b1 < mouseX){
       pixels[loc1] = color(0);
     } else {
       pixels[loc1] = color(255);
     }
   }
 } 
  updatePixels();
}
