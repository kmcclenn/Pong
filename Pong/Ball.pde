// A class is that is the blueprint for what it means to be a Ball object
class Ball {

  // These properties can be different for each individual Ball
  float x;
  float y;
  float start_x;
  float start_y;
  float w = 20;
  float h = 20;
  float x_speed;
  float y_speed;
  float acceleration = 0.0005;


  // The constructor method in Processing is always the name of the class
  // The constructor runs once when an object is created
  Ball(float _x, float _y) {
    // Setting the initial values for each Ball as it is created
    x = _x;
    y = _y;
    start_x = _x;
    start_y = _y;

    x_speed = random(-7, 7);
    int random_int = int(random(1, 3));
    if (random_int == 1) {
      y_speed = 2;
    } else if (random_int == 2) {
      y_speed = -2;
    }

  }


  // The run method will execute all other methods that need to run once per frame
  void run() {
    draw_self();
    move();
    bounce();
  }
  void reset() {
    x = start_x;
    y = start_y;
    x_speed = random(-7, 7);
    int random_int = int(random(1, 3));
    if (random_int == 1) {
      y_speed = 2;
    } else if (random_int == 2) {
      y_speed = -2;
    }
    draw_self();
  }
  
  // Actually draw the circle on the screen
  void draw_self() {
    ellipse(x, y, w, h);
  }

  // Change the position variables based on speed
  void move() {
    x += x_speed;
    y += y_speed;
    if (x_speed > 0) {
      x_speed += acceleration;
    }
    if (x_speed < 0) {
      x_speed -= acceleration;
    }
    if (y_speed > 0) {
      y_speed += acceleration;
    }
    if (x_speed < 0) {
      y_speed -= acceleration;
    }
  }



  // Check if the ball is off screen. If so, then send the ball in the opposite direction
  void bounce() {
    // Too far to the right
    if (x + w/2 >= width) {
      // Using absolute value to force x speed to be negative
      x_speed = -1*abs(x_speed);
      // Forcing the ball back onto the screen since it has gone slightly right of the screen
      x = width - (h/2);
    }
    // Too far to the left
    if (x - w/2 <= 0) {
      // Using absolute value to force x speed to be positive
      x_speed = abs(x_speed);
      // Forcing the ball back onto the screen since it has gone slightly left of the screen
      x = h/2;
    }
  }
   
}


// if the ball has will reach the end of the screen in the next round, 
// 
