

// Inspired By: https://twitter.com/beesandbombs/status/1019924265540431872

// Due Jan 22 at 1400 hours

// Globals
// *************************************************************************************************
int[] $gridWidthArray = {10,20,50,100};
int $gridWidthArrayIndex = 1;
int $gridWidth = $gridWidthArray[$gridWidthArrayIndex]; //10, 20, 30, 50 for(600,600) canvas size
boolean $grid = true;
boolean $debug = false;
boolean $animating = false;
int $fRate = 40; // 40 seems to be smoothest for animation
int $strokeWeight = 3;
int $borderWidth = 100;
int $cols, $rows;

Director director; // create a Director object to handle interactions between elements

// Helper Methods
// *************************************************************************************************
void calculateProperties() {
  $cols = (width-2*$borderWidth)/$gridWidth;
  $rows = (height-2*$borderWidth)/$gridWidth;
}

void prepareAndCreateDirector(int newGridWidthArrayIndex) {
  background(255);
  $gridWidthArrayIndex = newGridWidthArrayIndex;
  $gridWidth = $gridWidthArray[$gridWidthArrayIndex];
  println("gridWidth: " + $gridWidth);
  println("gridWidthArrayIndex: " + $gridWidthArrayIndex);
  
  if ($grid) { drawGrid($gridWidth); }; // show grid
  
  calculateProperties();
  director = new Director(); 
}

// Setup
// *************************************************************************************************
void setup() {
  size(800, 800);
  background(255);
  smooth(8);
  rectMode(CORNER);
  stroke(0);
  strokeWeight($strokeWeight);
  frameRate($fRate);
  smooth(8);

  calculateProperties();

  if ($grid) { drawGrid($gridWidth); };

  director = new Director(); 
}

// Test segments to show how $animating works {

Segment t1 = new Segment($gridWidth, $gridWidth);
Segment t2 = new Segment($gridWidth*2, $gridWidth);
Segment t3 = new Segment($gridWidth*3, $gridWidth);

// used in demo animation
float i = 0;
float delta = .05;


// Draw
// *************************************************************************************************
void draw() {
  
  // This is where you can start with building your animation code
  // This does not involve easing (read about it: https://processing.org/examples/easing.html)
  // and as such, its pretty clunky. You'll likely want to build a new
  // animation algorithm
  if($animating) {
    background(255);
    if ($grid) { drawGrid($gridWidth); };
    
    i += delta;
    if(i > PI/2) {
     i = PI/2; 
    //delta = -1*delta; // make it negative if it gets to the "end"
    }
    if (i<= 0) {
      i = 0;
      //delta = -1*delta;
    }
    
    t1.setCurrentAngle(i);
    t1.showCurrent();

    t2.setCurrentAngle(i);
    t2.showCurrent();
   
    t3.setCurrentAngle(i);
    t3.showCurrent();
    
  }
  animate();
}

public void animate()
{
  if(key == '1') {  // set grid size 10
    prepareAndCreateDirector(0);
    director.showNext();
  }
  
  if(key == '2') {  // set grid size 20\
    prepareAndCreateDirector(1);
    director.showNext();
  }
  
  if(key == '3') {  // set grid size to 50
    prepareAndCreateDirector(2);
    director.showNext();
  }
  
  if(key == '4') {  // set grid size to 100
    prepareAndCreateDirector(3);
    director.showNext();
  }
  
  
}
