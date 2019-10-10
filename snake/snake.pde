ArrayList<PVector> snake = new ArrayList<PVector>();
int ssize = 20;
ArrayList<PVector> food = new ArrayList<PVector>();
boolean dead = false;

void setup(){
  size(1000, 500);
  
  frameRate(5);
  rectMode(CENTER);
  
  snake.add(new PVector(250, 250));
  //snake.add(new PVector(250, 230));
  //snake.add(new PVector(250, 210));
  //snake.add(new PVector(250, 190));
  //snake.add(new PVector(250, 170));
  //snake.add(new PVector(250, 150));
  //snake.add(new PVector(250, 130));
  
  food.add(new PVector(90, 90));
  food.add(new PVector(90, 190));
  food.add(new PVector(90, 290));
  food.add(new PVector(390, 90));
}

//LEFT UP RIGHT DOWN
// 37  38  39    40
final int LEFT = 37;
final int UP = 38;
final int RIGHT = 39;
final int DOWN = 40;
int direction = UP;
void draw(){
  background(200);
  
  PVector first = snake.get(snake.size()-1).copy();
  
  PVector temp = new PVector(0, 0);
  if(direction == UP){
    temp = new PVector(0, -ssize);
  } else if(direction == DOWN){
    temp = new PVector(0, ssize);
  } else if(direction == LEFT){
    temp = new PVector(-ssize, 0);
  } else if(direction == RIGHT){
    temp = new PVector(ssize, 0);
  }
  
  first.add(temp);
  snake.add(first);
  
  for(int i = 0; i < snake.size()-2; i++){
    if((snake.get(i).x == first.x) && (snake.get(i).y == first.y)) dead = true;
  }
  
  if(first.x > width || first.x < 0 || first.y > height || first.y < 0) dead = true;

  boolean hasEaten = false;
  for(int i = 0; i < food.size(); i++){
    if((food.get(i).x == first.x) && (food.get(i).y == first.y)) {
      hasEaten = true;
      food.remove(i);
      addFood();
      break;
    }
  }
  if(!hasEaten) snake.remove(0);

  fill(50, 250, 77);
  for(PVector p : snake) {
    rect(p.x, p.y, ssize-2, ssize-2, 3);
  }
  
  fill(250, 20, 44);
  for(PVector p : food) {
    rect(p.x, p.y, ssize-2, ssize-2, 3);
  }
  
  if(dead){
    background(255, 0, 0);
    noLoop();
  }
  
  //show the score
  textSize(32);
  text(snake.size()-1, 10, 30);
}

void keyPressed() {
  if (keyCode == UP && direction != DOWN) {
    direction = UP;
  } else if (keyCode == DOWN && direction != UP) {
    direction = DOWN;
  } else if (keyCode == LEFT && direction != RIGHT) {
    direction = LEFT;
  } else if (keyCode == RIGHT && direction != LEFT) {
    direction = RIGHT;
  }
}

void addFood() {
  int x = (int)(Math.floor(Math.random()*(width/ssize)) * ssize + ssize/2);
  int y = (int)(Math.floor(Math.random()*(height/ssize)) * ssize + ssize/2);
  food.add(new PVector(x, y));
}
