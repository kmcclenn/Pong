// A class is that is the blueprint for what it means to be a Ball object
class Square {

  // These properties can be different for each individual Ball
  PVector location = new PVector();
  float start_x;
  float start_y;
  float side = 20;
  PVector speed = new PVector();
  float acceleration = 0.0005;
  float start_y_speed = 4;
  float start_x_speed = 6;


  // The constructor method in Processing is always the name of the class
  // The constructor runs once when an object is created
  Square(float _x, float _y) {
    // Setting the initial values for each Ball as it is created
    location.x= _x;
    location.y = _y;
    start_x = _x;
    start_y = _y;

    speed.x = pow(-1, int(random(1, 3))) * start_x_speed;
    speed.y = pow(-1, int(random(1, 3))) * start_y_speed;

  }


  // The run method will execute all other methods that need to run once per frame
  void run() {
    draw_self();
    move();
    bounce();
  }
  void reset() {
    location.x= start_x;
    location.y = start_y;
    speed.x = pow(-1, int(random(1, 3))) * start_x_speed;
    speed.y = pow(-1, int(random(1, 3))) * start_y_speed;
    draw_self();
  }
  
  // Actually draw the circle on the screen
  void draw_self() {
    rect(location.x, location.y, side, side);
  }

  // Change the position variables based on speed
  void move() {
    location.x += speed.x;
    location.y += speed.y;
    if (speed.x > 0) {
      speed.x += acceleration;
    }
    if (speed.x < 0) {
      speed.x -= acceleration;
    }
    if (speed.y > 0) {
      speed.y += acceleration;
    }
    if (speed.x < 0) {
      speed.y -= acceleration;
    }
  }



  // Check if the ball is off screen. If so, then send the ball in the opposite direction
  void bounce() {
    // Too far to the right
    if (location.x + side >= width) {
      // Using absolute value to force x speed to be negative
      speed.x = -1*abs(speed.x);
      // Forcing the ball back onto the screen since it has gone slightly right of the screen
      location.x = width - side;
    }
    // Too far to the left
    if (location.x <= 0) {
      // Using absolute value to force x speed to be positive
      speed.x = abs(speed.x);
      // Forcing the ball back onto the screen since it has gone slightly left of the screen
      location.x = 0;
    }
  }
   
}


// if the ball has will reach the end of the screen in the next round, 
// 
