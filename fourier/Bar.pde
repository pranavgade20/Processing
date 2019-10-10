class Bar {
  float len;
  float angular_vel;
  float angular_disp;
  
  Bar b;
  
  float x;
  float y;
  
  Bar() {
    this.len = 20;
    this.angular_vel = 0.05;
    this.angular_disp = 0;
  }
  
  Bar(float len, float angular_vel) {
    this.len = len;
    this.angular_vel = angular_vel;
    this.angular_disp = 0;
    
    this.x = len;
    this.y = 0;
  }
  
  void update() {
    angular_disp +=  angular_vel;
    
    this.x = len * (float)Math.cos(angular_disp);
    this.y = len * (float)Math.sin(angular_disp);
    
    if(!(this.b == null)) this.b.update();
  }
  
  void show(float x, float y){
    line(x, y, x+this.x, y+this.y);
    
    if(!(this.b == null)) this.b.show(x+this.x, y+this.y);
  }

  PVector trace(float x, float y){
    // alternative for show, this will show and return only show a single point in the end
    // do not use with background()
    
    //if(this.b == null) point(x+this.x, y+this.y);
    //else this.b.trace(x+this.x, y+this.y);
    
    if(this.b == null) return new PVector(x+this.x, y+this.y);
    else return this.b.trace(x+this.x, y+this.y);
  }
  
  void append(Bar b){
    if(this.b == null) this.b = new Bar(b.len, b.angular_vel+this.angular_vel);
    else this.b.append(b);
  }
}
