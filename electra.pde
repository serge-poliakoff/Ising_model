
class Ising{
  private byte[][] es;
  private int sx,sy;
  private float T;
  private float J = 1f;
  
  
  
  Ising(int size_x, int size_y, byte s, float temp, float Jkf){
    sx = size_x;
    sy = size_y;
    es = new byte[size_x][size_y];
    for(int i=0;i<size_x;i++){
      for(int j=0;j<size_y;j++){
        if(s==0)
          es[i][j] = (byte)(random(0,100)>50?-1:1);
         else
           es[i][j] = s;
      }
    }
    J = Jkf;
    set_temp(temp);
  }
  
  public void set_temp(float new_t){
   T = new_t; 
  }
  
  public void monte_carlo(){
    int ind_i = (int)random(0,sx);
    int ind_j = (int)random(0,sy);
    float dE = 0;

    if(ind_i>0)
      dE += -1*J*(-1*es[ind_i][ind_j]*es[ind_i-1][ind_j]);  //left
     if(ind_i<sx-1)
      dE += -1*J*(-1*es[ind_i][ind_j]*es[ind_i+1][ind_j]); //right
     if(ind_j>0)
      dE += -1*J*(-1*es[ind_i][ind_j]*es[ind_i][ind_j-1]); //down
     if(ind_j<sy-1)
      dE += -1*J*(-1*es[ind_i][ind_j]*es[ind_i][ind_j+1]); //up
     
    if(dE<0)
      es[ind_i][ind_j]*=-1;
     else{
       if(random(0,1)<exp(-2*dE/T)){
         es[ind_i][ind_j]*=-1;
       }
     }
  }
  
  float get_magnetisation(){
    float m = 0;
    for(int i=0;i<size_x;i++)
      for(int j=0;j<size_y;j++)
        m+=es[i][j];
    return m/(size_x*size_y);
  }
  
  void render(){
    for(int i=0;i<sx;i++){
      for(int j=0;j<sy;j++){
        stroke(/*(es[i][j]+1)/2*255*/gamme(es[i][j]));
        point(i,j);
      }
    }
  }
  
}

//just some other functions, meant to be static, but it's a bit complicated in processing, so here they are

color up = color(0,255,255);
color down = color(200, 145, 0);
color gamme(byte s){
  if(s>0) return up;
  return down;
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
