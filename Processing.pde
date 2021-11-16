  //   Scream 
  //   Experiment 3 
  //   Mehdi Farahani
      ///////////////////////////////////////////////////////////////////////////
      
import processing.serial.*;  // import the Processing serial library
Serial myPort;               // The serial port
import processing.sound.*;   // import the sound library

SoundFile musicscream;
SoundFile musiclaugh;
PImage imgscream;            // The scream painting by Edvard Munch
PImage imglaugh;             // manipulated painting 

int scream = 0;
int laugh = 0;

float imgWave1;  
float imgWave2;  

      ///////////////////////////////////////////////////////////////////////////

void setup() {
      //size(800,800);
      
     
      fullScreen();
      musicscream = new SoundFile (this,"screamsound.mp3");
      musiclaugh = new SoundFile (this,"laughsound.mp3");
      imglaugh = loadImage("laugh.jpg");
      imgscream = loadImage("scream.jpg");
          
      printArray(Serial.list());
      String portName = Serial.list()[2];
      myPort = new Serial(this, portName, 9600);
      myPort.bufferUntil('\n');
}

      ///////////////////////////////////////////////////////////////////////////
      
void draw() {

      background(0);
      //size(100, 100);
      //imageMode(CENTER);
      
      if (scream >= 30) {
      image(imgscream, -200, -150);
      noStroke();
      fill(0);
      }
      
      
      if (laugh >= 30){
      image(imglaugh, -200, -150);
      noStroke();
      fill(250);
      }
      
     
      
      //else{
      //background(0);
      //}

      
      ///////////////  ellipse   ///////////////
      for (int mehdi1 = 2; mehdi1 <= width; mehdi1 += 50) {      //ellipse width
      for (int mehdi2 = 15; mehdi2 <= height; mehdi2 += 50) {    // ellipse height   
  
      float mouseDist = dist(1000, 560, mehdi1, mehdi2);        // ellipse centre
      
      float diameter = (mouseDist / imgWave1) * 2;               // dot waves scale (scream)
      float diameter2 = (mouseDist / imgWave2) * 2;             // dot waves scale (laugh)
      ellipse(mehdi1, mehdi2, diameter, diameter);
      
    
      ellipse(mehdi1, mehdi2, diameter2, diameter2);
      /////////////////////////////////////////////          
                   
}}

}


      ///////////////////////////////////////////////////////////////////////////
      
void serialEvent(Serial myPort) {
    
   
     String myString = myPort.readStringUntil('\n');
     if (myString != null) {
         myString = trim(myString);
      
      String sensors[]= split(myString,',');
      
      scream = int(sensors[0]);
      laugh = int(sensors[1]);
         
              
          
     imgWave1 = int(scream/5);
     println("scream" + scream);
     
     imgWave2 = int(laugh/5);
     println("laugh" + laugh); 

      
     if  (scream > 140) // scream sound 
         {musicscream.play();}
         
                  
     if  (laugh > 140) // laugh sound 
         {musiclaugh.play();
       
     }
       
  }
      
}
