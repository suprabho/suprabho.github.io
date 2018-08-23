//  import processing.serial.*;
  import ddf.minim.*;
  import ddf.minim.analysis.*;
  import processing.pdf.*;
  //import java.util.Calendar;
  
  
  Minim minim;
  AudioPlayer player;
  AudioMetaData meta;
  BeatDetect beat;
  AudioInput in;
  FFT fft;
  int highest=0;
  //boolean savePDF = true;
  
  //Serial myPort;
 // String val;
  
  int  r = 100;
  float rad = 70;
  color[] stylesheet= {#FF2D00, #04756F, #D90000, #FF2D00, #FF8C00};
  color[] palette= stylesheet;
  //int a = 0;
  //int b = 3;
  
  
  void setup()
  {
    size(displayWidth, displayHeight);
    //size(600, 400);
    minim = new Minim(this);
    
    in = minim.getLineIn(Minim.MONO, 2048, 96100);
    fft = new FFT(in.left.size(), 96100);
  //  player = minim.loadFile("G:/Music/Martin Garrix & Jay Hardway - Wizard (Official Music Video).mp3");
  //  meta = player.getMetaData();
    beat = new BeatDetect();
  //  player.loop();
    //player.play();
    background(#2E0927);
    noCursor();
//      String portName = Serial.list()[0];
//    myPort = new Serial(this, portName, 9600);

    
  }
  
  void draw()
    {
      
      
      
    float t = map(mouseX, 0, width, 0, 1);
    fft.forward(in.left);
    
    //background
    fill(#2E0927, 20);
    noStroke();
    rect(0, 0, width, height);
    translate(width/2, height/2);
    noFill();
    
   
    //ellipse
  
  //  fill(palette[1], 5);
  //  if (beat.isOnset()) rad = rad*2;
  //  else rad = 70;
  //  ellipse(0, 0, 2*rad, 2*rad);
    
    
    //line
    
    int bsize = in.bufferSize();
    for (int i = 2048; i < bsize - 1; i+=10)
    {
      float x = (r)*cos(i*100*PI/bsize);
      float y = (r)*sin(i*100*PI/bsize);
      float x2 = (r + in.left.get(i)*200)*cos(i*1*PI/bsize);
      float y2 = (r + in.left.get(i)*200)*sin(i*1*PI/bsize);
      line(x, y, x2, y2);
      float d = dist(x,y, x2, y2);
      pushStyle();
      print(bsize);
      
         
      if(d<100){
      stroke(palette[1],10);
      strokeWeight(1);
  //    myPort.write('0');
  //    println("0");
      }
      else if(d>100 && d<150){
      stroke(palette[1],15);
      strokeWeight(1);
  //    myPort.write('1');
  //    println("1");
      }
      
       else if(d>150 && d<200){
      stroke(palette[1],15);
      strokeWeight(1);
  //     myPort.write('2');
  //    println("2");
  }
      
       else if(d>200 && d<250){
      stroke(palette[1],50);
      strokeWeight(1);
  //    myPort.write('3');
  //    println("3");
    }
      
      else if(d>250){
      stroke(palette[1],15);
      strokeWeight(1);
      
    }
  //    println(d);
      
       
    }
   
    
    //dots
    beginShape();
    noFill();
    stroke(palette[1],20);
//     myPort.write('0');
//      println("0");
  
    for (int i = 0; i < bsize; i+=5)
    {
      float x2 = (r + in.left.get(i)*2000)*cos(i*100*PI/bsize);
      float y2 = (r + in.left.get(i)*2000)*sin(i*100*PI/bsize);
      vertex(x2, y2);
      float d = dist(0,0, x2, y2);
      pushStyle();
//     myPort.write('0');
//      println("0");   
      if(d<200){
      stroke(palette[0],1);
      strokeWeight(20);
       
  }
      
      
      
       else if(d>200 && d<350){
      stroke(palette[4]);
      strokeWeight(5);
    
  
    }
      
       else if(d>350 && d<450){
      stroke(palette[3]);
      strokeWeight(10);
       
  
    }
      
      else if(d>450){
      stroke(palette[2]);
      strokeWeight(15);
//         myPort.write('1');
//      println("1");
  
   
     }
      
     
      point(x2, y2);
      popStyle();
      
      
    }
    endShape();
   if (flag)
   showMeta();
   PFont font;
 font = loadFont ("Gotham-Black-48.vlw"); 
 
  for (int i = 0; i < bsize; i+=45){
  
   smooth();
 
    float x2 = (r + in.left.get(i)*2000)*cos(i*100*PI/bsize);
    float y2 = (r + in.left.get(i)*2000)*sin(i*100*PI/bsize);
    vertex(x2, y2);
    float d = dist(0,0, x2, y2);
    pushStyle();
   
    if(d>350 && d<450){
    fill(palette[4]);
//  fill(palette[2]);
    textSize(43);
    textAlign(CENTER);
    textFont(font);
    text("Welcome to", 0 , 0);
//    saveFrame();
    smooth();

  }
    
    else if(d>450){
  fill(palette[4]);
//  fill(palette[2]);
    textSize(43);
    textAlign(CENTER);
    textFont(font);
    text("Department of Design", 0 , 45);
//    saveFrame();
    smooth();

   }
    
  } 
   
   
  //   if (savePDF) {
  //    savePDF = true;
  //    endRecord();
    
  //}
    
  // saveFrame(); 
//  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
//  pdf.nextPage();  // Tell it to go to the next page
//
//  // When finished drawing, quit and save the file
//  if (frameCount == 50) {
//    exit();
//  }
  }
  
  
  void showMeta() {
    int time =  meta.length();
    textSize(50);
    textAlign(CENTER);
    text( (int)(time/1000-millis()/1000)/60 + ":"+ (time/1000-millis()/1000)%60, -7, 21);
  }
  
     
   
  
  boolean flag =false;
  void mousePressed() {
    if (dist(mouseX, mouseY, width/2, height/2)<150) flag =!flag;
  }
  
  //
  
  void keyPressed() {
    if(key==' ')exit();
    if(key=='s')saveFrame("###.tif");
  }
  
  //void keyPressed(){
  //   if (key == 'p' || key == 'P') savePDF = true;}
  
  //String timestamp() {
  //  Calendar now = Calendar.getInstance();
  //  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
  //  }
     
