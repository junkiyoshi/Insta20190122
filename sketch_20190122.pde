void setup()
{
  size(512, 512);
  frameRate(30);
  background(239);
  colorMode(HSB);
}

void draw()
{
  randomSeed(39);
  
  fill(239, 8);
  noStroke();
  rect(0, 0, width, height);
  
  PVector location;
  for(int i = 0; i < 16; i++)
  {     
    location = new PVector(map(noise(random(100), frameCount * 0.01), 0, 1, -100, width + 100), map(noise(random(100), frameCount * 0.01), 0, 1, -100, height + 100));
    if(location.x < 0) { location.x = 0; }
    if(location.x >= width) { location.x = width - 1; }
    if(location.y < 0) { location.y = 0; }
    if(location.y >= height) { location.y = height - 1; }
    
    fill(i * 16, 255, 230);
    ellipse(location.x, location.y, 25, 25);
  }
  
  loadPixels();
  
  for(int i = 0; i < 1500; i++)
  { 
    location = new PVector(map(noise(random(100), frameCount * 0.001), 0, 1, -200, width + 200), map(noise(random(100), frameCount * 0.001), 0, 1, -200, height + 200));
    if(location.x < 0) { location.x = 0; }
    if(location.x >= width) { location.x = width - 1; }
    if(location.y < 0) { location.y = 0; }
    if(location.y >= height) { location.y = height - 1; }
    color c = pixels[int(location.x) + width * int(location.y)];
    
    fill(c);
    ellipse(location.x, location.y, 8, 8);
  }
}
