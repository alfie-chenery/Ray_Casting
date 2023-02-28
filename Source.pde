class Source{
  PVector pos;
  ArrayList<Ray> rays;
  
  Source(float X, float Y){
    pos = new PVector(X,Y);
    rays = new ArrayList<Ray>();
    for(int i=0; i<360; i+=10){
      Ray r = new Ray(X,Y,radians(i));
      rays.add(r);
    }
  }
  
  void update(float X, float Y){
    pos.x = X;
    pos.y = Y;
    for(Ray r : rays){
      r.update(X,Y); 
    }
    
  }
  
  void show(){
    stroke(255);
    strokeWeight(1);
    circle(pos.x,pos.y,5);
    
  }
  
  void shine(ArrayList<Boundary> walls){
    for(Ray r : rays){
      PVector closest = null;
      float record = 999999999;
      for(Boundary wall : walls){
        PVector point = r.cast(wall);
        if(point != null){
          float dist = sqrt(abs(sq(point.x - pos.x) + sq(point.y - pos.y)));
          if(dist<record){
            record = dist;
            closest = point;
          }
        }
      }
      if(closest != null){
        stroke(255,100);
        line(pos.x,pos.y,closest.x,closest.y);
      }
    }
  }
  
  void spin(){
    for(Ray r : rays){
      float a = r.angle;
      r.rotate(a+0.01);
      
    }
  }
  
  
}
