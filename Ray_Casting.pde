ArrayList<Boundary> walls;
Source light;
boolean spin;

void setup(){
  size(800,800);
  walls = new ArrayList<Boundary>();
  light = new Source(0,0);
  
  Boundary b = new Boundary(1,1,width-1,1);
  walls.add(b);
  b = new Boundary(1,1,1,height-1);
  walls.add(b);
  b = new Boundary(width-1,1,width-1,height-1);
  walls.add(b);
  b = new Boundary(1,height-1,width-1,height-1);
  walls.add(b);
  
  for(int i=0; i<5; i++){
    b = new Boundary(random(width),random(height),random(width),random(height));
    walls.add(b);
  }
  
}

void mousePressed(){
  spin = true;
}

void mouseReleased(){
  spin = false;
}

void draw(){
  background(0);
  for(Boundary b : walls){
    b.show(); 
  }
  
  light.update(mouseX,mouseY);
  
  if(spin){
    light.spin(); 
  }
  
  light.shine(walls);
  
  light.show();
}
