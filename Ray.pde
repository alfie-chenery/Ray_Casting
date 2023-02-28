class Ray{
  PVector pos;
  PVector dir;
  float angle;

  Ray(float X, float Y, float a){
    pos = new PVector(X,Y);
    dir = PVector.fromAngle(a);
    angle = a;
  }
  
  void rotate(float a){
    angle = a;
    dir = PVector.fromAngle(a);
  }
  
  void update(float X, float Y){
    pos.x = X;
    pos.y = Y;
  }
  
  void show(){
    stroke(255);
    strokeWeight(1);
    line(pos.x,pos.y,pos.x+20*dir.x,pos.y+20*dir.y);
  }
  
  PVector cast(Boundary wall){
    float x1 = wall.a.x;
    float y1 = wall.a.y;
    float x2 = wall.b.x;
    float y2 = wall.b.y;
    
    float x3 = pos.x;
    float y3 = pos.y;
    float x4 = pos.x + dir.x; //cos(a)
    float y4 = pos.y + dir.y; //sin(a)
    
    float denominator = (x1-x2)*(y3-y4)-(y1-y2)*(x3-x4);
    if(denominator == 0){
      return null; 
    }
    //line segment intersection formula
    float t = ((x1-x3)*(y3-y4)-(y1-y3)*(x3-x4))/denominator;
    float u = -((x1-x2)*(y1-y3)-(y1-y2)*(x1-x3))/denominator;
    
    if(t>0 && t<1 && u>0){
      PVector point = new PVector(x1 + t*(x2-x1), y1 + t*(y2-y1));
      return point;
    }else{
      return null; 
    }
  }
  
}
