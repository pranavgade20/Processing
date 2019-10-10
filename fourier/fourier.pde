Bar b;
ArrayList<PVector> locs = new ArrayList<PVector>();
float no = 0.03;

void setup(){
  size(1000, 500);
  
  //b = new Bar((float)Math.random()*50, (float)Math.random()*0.01);
  //for(int i = 0; i < 10; i++){
  //  Bar b1 = new Bar((float)Math.random()*50, (float)Math.random()*0.01);
  //  b.append(b1);
  //}
  b = new Bar(25, no);
  for(int i = 0; i < 10; i++){
    Bar b1 = new Bar(25-2.5*i, no+0.01);
    b.append(b1);
  }
  
  b.update();
  locs.add(b.trace(width/2, height/2));
}

boolean trace = false;
void draw() {
  background(200);
  b.update();
  locs.add(b.trace(width/2, height/2));
  if(trace){
    stroke(0);
    b.show(width/2, height/2);
    stroke(0, 100);
  }

  for(int i = 0; i < locs.size()-2; i++) {
    line(locs.get(i).x, locs.get(i).y, locs.get(i+1).x, locs.get(i+1).y);
  }
  
  stroke(255, 0, 0);
  int offset = ((locs.size()-width>0)?locs.size()-width:0);
  for(int i = 0; i < ((locs.size()>width)?width:locs.size())-1; i++) {
    line(i, locs.get(i+offset).y, i+1, locs.get(i+offset+1).y);
  }
// ((locs.size()-width>0)?locs.size()-width:0)
  stroke(0);
}

void mousePressed(){
  trace = !trace;
  background(200);
  stroke(0);
}

void mouseReleased(){
  trace = !trace;
  background(200);
  stroke(0);
}
