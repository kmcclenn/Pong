void setup () {
  size(400, 400);
  
}

int[] score = {0, 0};

// position is slightly hardcoded
Ball ball = new Ball(200, 200);
Rect rect_1 = new Rect(200, 50);
Rect rect_2 = new Rect(200, 350);

void draw() {
  background(0);
  ball.run();
  rect_1.draw_self();
  rect_2.draw_self();
  
  if (keyPressed) {
    if (key == 'd') {
      rect_2.move(1);
    }
    if (key == 'a') {
      rect_2.move(-1);
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        rect_1.move(1);
      }
      if (keyCode == LEFT) {
        rect_1.move(-1);
      } 
    }
  }
  
  if (((ball.y + ball.h/2) > rect_2.y) && (ball.x > rect_2.x) && (ball.x < (rect_2.x + rect_2.w))) {
    ball.change_y_speed(ball.y_speed * -1); 
  }
  
  if (((ball.y - ball.h/2) < (rect_1.y + rect_1.h)) && (ball.x > rect_1.x) && (ball.x < (rect_1.x + rect_1.w))) {
    ball.change_y_speed(ball.y_speed * -1); 
  }
  
  if ((ball.y + ball.h/2) < 0) {
    score[1] += 1;
    print("Top player: ", score[0], " Bottom player: ", score[1]);
    delay(3000);
    ball.reset();
  }
  
  if ((ball.y - ball.h/2) > height) {
    score[0] += 1;
    print("Top player: ", score[0], " Bottom player: ", score[1]);
    delay(3000);
    ball.reset();
  }
  
}
