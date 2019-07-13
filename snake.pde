
int posx;
int posy;
boolean grid[][];
boolean hasFood;
String direction;
int numRect;
float speed; 
int r_c = 20; //holds number of rows and cols
int xmovement;
int ymovement;
int food[] = new int[2];


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
  frameRate(10);
  
  
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
  background(255,218,185);
  drawRects();


  fill(0, 255, 0, 100);
  rect(food[0] * 30, food[1] * 30, 30, 30);
}

void update() {
  if (posx != 19){
    if (xmovement == 1){
      posx += xmovement;
      grid[posx][posy] = true;
    }
  }
  else {
    grid[posx][posy] = true;
  }
  if (posy != 19){
    if (ymovement == 1){
      posy += ymovement;
      grid[posx][posy] = true;
    }
  }
  else {
    grid[posx][posy] = true;
  }
  if (posx != 0){
    if (xmovement == -1){
      posx += xmovement;
      grid[posx][posy] = true;
    }
  }
  else {
    grid[posx][posy] = true;
  }
  if (posy != 0){
    if (ymovement == -1){
      posy += ymovement;
      grid[posx][posy] = true;
    }
  }
  else {
    grid[posx][posy] = true;
  }
  
  if (!hasFood) {
    spawnFood();  
  }
}



void drawRects() {
  update();
  for (int i = 0; i < r_c
  ; i++)
    for (int j = 0; j < r_c; j++) {
      if (grid[i][j]) {
        fill(255, 0, 0, 100);
        rect(i * 30, j * 30, 30, 30);
        grid[i][j] = false;
      }
    }
}


int[] spawnFood() {
  hasFood = true;
  food[0] = int(random(0, r_c));
  food[1] = int(random(0, r_c));
  return food;  
}


void keyPressed() {
  if (key == 'd') {
    xmovement = 1;
    ymovement = 0;
  }
  
  if (key == 'w') {
    ymovement = -1;
    xmovement = 0;
  }
  
  if (key == 'a') {
    xmovement = -1;
    ymovement = 0;
  }
  
  if (key == 's') {
    ymovement = 1;
    xmovement = 0;
  }
  
}
