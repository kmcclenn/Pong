void setup () {
  size(400, 400);
}

float k = 0.05;
int[] score = {0, 0};

// position is slightly hardcoded
Square square = new Square(200, 200);
Rect rect_1 = new Rect(200, 50);
Rect rect_2 = new Rect(200, 350);



void draw() {
  background(0);
  square.run();
  rect_1.draw_self();
  rect_2.draw_self();

  float distance_mouse_rect = mouseX - rect_1.x;
  rect_1.move(k * distance_mouse_rect);
  rect_2.x = square.location.x - rect_2.w / 2;



  if (((square.location.y + square.side) > rect_2.y) && (square.location.x + square.side > rect_2.x) && (square.location.x < (rect_2.x + rect_2.w))) {
    square.speed.y = square.speed.y * -1;
  }

  if (((square.location.y) < (rect_1.y + rect_1.h)) && (square.location.x + square.side > rect_1.x) && (square.location.x < (rect_1.x + rect_1.w))) {
    //square.speed.y = square.speed.y * -1;
    float percent_through_rect = ((square.location.x + square.side/2) - (rect_1.x))/(rect_1.w);
    float angle = (PI * (1 - percent_through_rect));
    if (angle > HALF_PI + QUARTER_PI) {
      angle = HALF_PI + QUARTER_PI;
    }
    if (angle < QUARTER_PI) {
      angle = QUARTER_PI;
    }
    print(angle);
    //print(angle);
    square.speed = PVector.fromAngle(angle).setMag(square.speed.mag());

   
  }
  
  if (((square.location.x + square.side) > rect_1.x) && ((square.location.x + square.side) < rect_1.x + rect_1.w/2) && (square.location.y + square.side > rect_1.y) && (square.location.y < (rect_1.y + rect_1.h))) {
    square.speed.x = square.speed.x * -1;
  }
  
  if (((square.location.x - square.side) < rect_1.x + rect_1.w) && ((square.location.x) > rect_2.x + rect_2.w/2) && (square.location.y + square.side > rect_1.y) && (square.location.y < (rect_1.y + rect_1.h))) {
    square.speed.x = square.speed.x * -1;
  }

  if ((square.location.y + square.side) < 0) {
    score[1] += 1;
    print("Top player: ", score[0], " Bottom player: ", score[1]);
    delay(3000);
    square.reset();
  }

  if (square.location.y > height) {
    score[0] += 1;
    print("Top player: ", score[0], " Bottom player: ", score[1]);
    delay(3000);
    square.reset();
  }
}
