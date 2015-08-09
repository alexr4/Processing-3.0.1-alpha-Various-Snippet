class Grid
{
  int cols, rows;
  float resX, resY;
  PVector loc;
  float gWidth, gHeight;

  Pt[][] allPts;
  
  float noff0, noff1, noff2, n0, n1, n2;
  
  Grid(PVector loc_, int cols_, int rows_, int resX_, int resY_)
  {
    PVector loc = loc_;
    cols = cols_;
    rows = rows_;
    gWidth = resX_;
    gHeight = resY_;
    allPts = new Pt[cols][rows];

    for (int i=0; i<cols; i++)
    {
      noff0 = noise(n0);
      for (int j=0; j<rows; j++)
      {
        noff1 = noise(n1);
        
        float z = noise(i*noff0, j*noff1)*20;
        
        PVector v = new PVector(loc.x+i*gWidth, loc.y+j*gHeight, loc.z+z);
        

        allPts[i][j] = new Pt(this, v, i, j);
        
        n1+=0.002;
      }
      n0 += 0.003;
    }
  }

  void run()
  { 
    runPoints();

  }

  void runPoints()
  {
    beginShape(TRIANGLES);
    noStroke();
    for (int i=0; i<cols; i++)
    {
      for (int j=0; j<rows; j++)
      {
        allPts[i][j].run();
      }
    }
    endShape();
  }
}