class Rect {
  
  float x;
  float y;
  float w;
  float h;
  
  Rect(float _x, float _y) {
    x = _x;
    y = _y;
    h = 30;
    w = 70; 
    
  }
  
  void draw_self() {
    rect(x, y, w, h);
  }
  
  void move(float x_speed) {
    x += x_speed;
  }
  
  
}
