
ArrayList<Ball> balls = new ArrayList<Ball>();
Ball ball;
void setup(){
  size(700,600);
  for(int i=0;i<50;i++){
  Ball ball = new Ball(10*i,20,10);
  balls.add(ball);
  }
}
void draw(){
  background(46, 217, 255);
  for(Ball ball:balls){
    for(Ball bal:balls){
      if(!ball.equals(bal)){
        ball.isTouching(bal);
      }
    }
    ball.move();
    
  }
}






















class Ball{
  float posX,posY,size,radius;
  float speedY = 5;
  float speedX = 5;
  boolean delay = true;
  boolean delax = true;
  public Ball(float x,float y,float size){
    this.size = size;
    this.radius = size;
    this.posX = x+radius;
    this.posY = y+radius;
    this.speedX = random(10);
    this.speedY = random(10);
    
  }
  public void isTouching(Ball b1){
    float distance = sqrt(pow(b1.posX-this.posX,2)+pow(b1.posY-this.posY,2));
    if(abs(b1.radius-this.radius)<=abs(distance)&&abs(b1.radius+this.radius)>=abs(distance)){
      
      //same Right Meeting DONE.
      if(b1.speedX>0&&this.speedX>0){
        if(this.posX>b1.posX)
        b1.speedX = -b1.speedX;
        else if(this.posX==b1.posX){
          b1.speedX = -b1.speedX;
          this.speedX = -this.speedX;
        }else{
          this.speedX = -this.speedX;
        }
       // return;
      }
      //same Up Meeting
      if(b1.speedY>0&&this.speedY>0){
        if(this.posY>b1.posY){
          b1.speedY = -b1.speedY;
        }else if(this.posY == this.posY){
          b1.speedY = -b1.speedY;
          this.speedY = -this.speedY;
        }else{
          this.speedY = -this.speedY;
        }
      //  return;
      }
      //same left meeting
      if(b1.speedX<0&&this.speedX<0){
        if(this.posX<b1.posX){
          b1.speedX = -b1.speedX;
        }else if(this.posX==b1.posX){
          this.speedX = -this.speedX;
          b1.posX = -b1.posX;
        }else{
          this.speedX = -this.speedX;
        }
      //  return;
      }
      //same down Mitting
      if(b1.speedY<0&&this.speedY<0){
        if(this.posY>b1.posY){
          this.speedY = -this.speedY;
        }else if(this.posY == b1.posY){
          this.speedY = -this.speedY;
          b1.speedY = -b1.speedY;
        }else{
          b1.speedY = -b1.speedY;
        }
      //  return;
      }
      //one right one left meeting
      if(b1.speedX>0&&this.speedX<0){
        if(b1.posX<=this.posX){
          b1.speedX = -b1.speedX;
          this.speedX = -this.speedX;
        }else{
          //dont do shit.
        }
    //  return;
      }
      //one up one down meeting
      if(b1.speedY>0&&this.speedY<0){
        if(b1.posY<=this.posY){
        this.speedY = -this.speedY;//--------
        b1.speedY = -b1.speedY;
        }else{
          //I know you want, but dont.
        }
      //  return;
      }
      //one left one right meeting
      if(b1.speedX<0&&this.speedX>0){
        if(b1.posX<=this.posX){
      this.speedX = -this.speedX;
      b1.speedX = -b1.speedX;
        }else{
          //dont even think about it.
        }
        
     // return;
      }
      //one down one up meeting
      if(b1.speedY>0&&this.speedY<0){
        if(b1.posY<=this.posY){
          this.speedY = -this.speedY;
          b1.speedY = -b1.speedY;
        }
        
     //   return;
      }
      
      
    }
  }
  public Ball(float size){
    this.size = size;
    this.radius = size;
    this.posX = 10+size;
    this.posY = 10+size;
    this.speedX = random(5);
    this.speedY = random(5);
    
  }
  void draw(){
  background(255);
  print("s");
  this.move();
  }
  public void move(int speed){
    
    
    
  }
  public void move(){
    this.posY += this.speedY;
    this.posX += this.speedX;
    ellipseMode(2);
    fill(67, 255, 46);
    ellipse(posX,posY,size,size);
    if(this.posY+this.radius>=height){
      this.posY = height-this.radius;
      this.speedY = -this.speedY;
    }
    if(this.posY-this.radius<=0){
       this.posY = 0+this.radius;
      this.speedY = -this.speedY;
    }
    if(this.posX+this.size/2>=width){
      this.posX = width-this.radius;
      this.speedX = -this.speedX;
    }
    if(this.posX-this.size/2<=0){
      this.posX = 0+this.radius;
      this.speedX = -this.speedX;
    }
    
    
  }
}