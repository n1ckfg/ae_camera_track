import peasy.PeasyCam;

PeasyCam cam;
String[] data;
ArrayList<PVector> points;

void setup() {
  size(960, 540, P3D);
  points = new ArrayList<PVector>();
  data = loadStrings("test.csv");
  for (int i=0; i<data.length; i++) {
    String[] line = data[i].split(",");
    if (line.length == 4) {
      float x = float(line[1]) / 1920.0;
      float y = float(line[2]) / 1080.0;
      float z = float(line[3]);
      println(x + ", " + y + ", " + z);
      points.add(new PVector(x * width + (width/2), y * height, z));
    }
  }
  
  cam = new PeasyCam(this, 400);
  stroke(255, 80);
}

void draw() {
  blendMode(NORMAL);
  background(0);
  
  blendMode(ADD);
  stroke(255, 127);
  strokeWeight(2);
  beginShape(QUAD_STRIP);
  for (int i=0; i<points.size(); i++) {
    PVector p = points.get(i);
    vertex(p.x, p.y, p.z);
  }
  endShape();
  
  stroke(0, 127, 127, 127);
  strokeWeight(20);
  beginShape(POINTS);
  for (int i=0; i<points.size(); i++) {
    PVector p = points.get(i);
    vertex(p.x, p.y, p.z);
  }
  endShape();
}
