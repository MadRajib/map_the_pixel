import processing.video.*;

Capture cam;

int rows, cols;
int scale;

char char_pixels[] = {'-','+','#','%','@'};

void setup() {
  size(1280, 960);
  scale = 20;
  
  
  
  cols = width/scale;
  rows =  height/scale;
  

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    exit();
  } else {
    cam = new Capture(this,cols,rows, cameras[0]);
    cam.start();     
  }      
}

// Read image from the camera
void captureEvent(Capture video) {  
  video.read();
}

void draw() {
  cam.loadPixels();
  
  
  for(int c = 0;c < cols; c++){
    for(int r =0; r< rows; r++){
      
      int x = c*scale;
      int y = r*scale;
      
      //cols - 1 -c to flip vertically
      color cr = cam.pixels[(cols-1 -c)+r*cam.width];
      float rr = red   (cr);
      float gr = green (cr);
      float bl = blue  (cr);
      float avg = (rr + gr+ bl)/3;
      
     
      char ch = char_pixels[int(avg/52)];
           
      //fill(avg);
      //rect(x,y,scale,scale);
      textSize(scale); 
      text(ch,x,y);
    }
  }
  
  
}
