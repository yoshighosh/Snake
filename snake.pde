
int posx;
int posy;
boolean grid[][];
boolean hasFood;
String direction;
int numRect;
float speed; 


void setup() {
  size(600,600);
  //noStroke();
 
  posx = 0;
  posy = 0;
  hasFood = false;
  direction = "D";
  numRect = 1;
  speed = 1;
  grid = new boolean[20][20];
  frameRate(5);
  
  
  for (int i = 0; i < 20; i++)
    for (int j = 0; j < 20; j++) {
      grid[i][j] = false;
    }
}



void draw() {
  
  //for(int i = 0; i < width; i+=30) {
  //  line(i, 0, i, height);
  //  line(0, i, width, i);
    
  //}
  
  drawRects();
  spawnFood();
  posy++;
  grid[posx][posy] = true;
  
}



void drawRects() {
  for (int i = 0; i < 20; i++)
    for (int j = 0; j < 20; j++) {
      if (grid[i][j]) {
        fill(255, 0, 0, 100);
        rect(i * 30, j * 30, 30, 30);
        fill(0);
      }
    }
}


void spawnFood() {
  
  if (!hasFood) {
    int foodX = int(random(0, 20));
    int foodY = int(random(0, 20));
    fill(0, 255, 0, 100);
    rect(foodX * 30, foodY * 30, 30, 30);
    fill(0);
    hasFood = true;
  }
  
}


void keyPressed() {
  if (key == 'd') {
    posx ++;
    grid[posx][posy] = true;
  }
  
  if (key == 'w') {
    posy--;
    grid[posx][posy] = true;
  }
  
  if (key == 'a') {
    posx --;
    grid[posx][posy] = true;
  }
  
  if (key == 's') {
    posy++;
    grid[posx][posy] = true;
  }
  
}
