void setup () {
  size(600, 600);
}

float k = 0.05;
float j = 0.1;
int[] score = {0, 0};

// position is slightly hardcoded
Square square = new Square(300, 300);
Rect rect_1 = new Rect(300, 50);
Rect rect_2 = new Rect(300, 550);
 


void draw() {
  println(float(height/2));
  background(0);
  square.run();
  rect_1.draw_self();
  rect_2.draw_self();
  
  float distance_mouse_rect = mouseX - (rect_1.x + rect_1.w/2);
  rect_1.move(k * distance_mouse_rect);
  float distance_rect_square = square.location.x + square.side/2 - (rect_2.x + rect_2.w/2);
  rect_2.move(j * distance_rect_square);



  if (((square.location.y + square.side) > rect_2.y) && (square.location.x + square.side > rect_2.x) && (square.location.x < (rect_2.x + rect_2.w))) {
    float percent_through_rect = ((square.location.x + square.side/2) - (rect_2.x))/(rect_2.w);
    float angle = (PI * percent_through_rect) + PI;
    if (angle > PI + HALF_PI + QUARTER_PI + PI/8) {
      angle = PI + HALF_PI + QUARTER_PI + PI/8;
    }
    if (angle < PI + QUARTER_PI - PI/8) {
      angle = PI + QUARTER_PI - PI/8;
    }
    float magnitude = square.speed.mag();
    square.speed.x = cos(angle) * magnitude;
    square.speed.y = sin(angle) * magnitude;
  } else if (((square.location.x + square.side) > rect_2.x) && ((square.location.x + square.side) < rect_2.x + rect_2.w/2) && (square.location.y + square.side > rect_2.y) && (square.location.y < (rect_2.y + rect_2.h))) {
    square.speed.x = square.speed.x * -1;
  } else if (((square.location.x ) < rect_1.x + rect_2.w) && ((square.location.x) > rect_2.x + rect_2.w/2) && (square.location.y + square.side > rect_2.y) && (square.location.y < (rect_2.y + rect_2.h))) {
    square.speed.x = square.speed.x * -1;
  
  }

  if (((square.location.y) < (rect_1.y + rect_1.h)) && (square.location.x + square.side > rect_1.x) && (square.location.x < (rect_1.x + rect_1.w))) {
    //square.speed.y = square.speed.y * -1;
    float percent_through_rect = ((square.location.x + square.side/2) - (rect_1.x))/(rect_1.w);
    float angle = (PI * (1 - percent_through_rect));
    if (angle > HALF_PI + QUARTER_PI + PI/8) {
      angle = HALF_PI + QUARTER_PI + PI/8;
    }
    if (angle < QUARTER_PI - PI/8) {
      angle = QUARTER_PI - PI/8;
    }
    float magnitude = square.speed.mag();
    square.speed.x = cos(angle) * magnitude;
    square.speed.y = sin(angle) * magnitude;
  } else if (((square.location.x + square.side) > rect_1.x) && ((square.location.x + square.side) < rect_1.x + rect_1.w/2) && (square.location.y + square.side > rect_1.y) && (square.location.y < (rect_1.y + rect_1.h))) {
    square.speed.x = square.speed.x * -1;
  } else if (((square.location.x) < rect_1.x + rect_1.w) && ((square.location.x) > rect_2.x + rect_2.w/2) && (square.location.y + square.side > rect_1.y) && (square.location.y < (rect_1.y + rect_1.h))) {
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
