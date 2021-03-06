import controlP5.*;

import java.util.Iterator;
import processing.core.PApplet;

final float GRAVITATION = 0.6;

StarsList starsSparkleList = new StarsList();
StarsList starsMovingList = new StarsList();
StarsList starsList = new StarsList();

ArrayList starsSparkle = new ArrayList();
ArrayList starsMoving = new ArrayList();
ArrayList stars = new ArrayList();

Planet moon = new Planet("Lune",5f, new PVector(0,0), new PVector(0,0.1), new PVector(0,0), 0.05);
Planet earth = new Planet("Terre",10f, new PVector(0,0), new PVector(0,0.7), new PVector(0,0), 0.2);
Planet sun = new Planet("Soleil",100f, new PVector(0,0), new PVector(0,0), new PVector(0,0), 200);



void setup() {
  size(640, 360);
  background(0);
  frameRate(60);
  for(int i=0; i < 150; i++){
    starsSparkle.add(new Star(random(width),random(height)));
  }
  starsSparkleList.addAllStarsList(starsSparkle);
  
  for(int i=0; i < 10; i++){
    starsMoving.add(new Star(random(width),random(height)));
  }
  starsMovingList.addAllStarsList(starsMoving);
  
  for(int i=0; i < 150; i++){
    stars.add(new Star(random(width),random(height)));
  }
  starsList.addAllStarsList(stars);
  
  sun.setPosition(width/2,height/2);
  earth.setPosition(150,height/2);
  moon.setPosition(140,height/2);

  Gui gui = new Gui(this);
  gui.createGroup();
}

void draw() {
  background(0);
  pushStyle();
  stroke(random(250));
  starsSparkleList.display();
  popStyle();
  
  pushStyle();
  stroke(255);
  starsList.display();
  popStyle();
  
  pushStyle();
  stroke(#FFAA00);
  fill(#FFF6AF);
  sun.applyForce(earth.getGravity());
  sun.update();
  sun.display();
  sun.setGravity(earth);
  popStyle();
  
  pushStyle();
  stroke(#CBEFFF);
  fill(#78B4FC);
  earth.applyForce(sun.getGravity());
  //earth.applyForce(moon.getGravity());
  earth.update();
  earth.display();
  earth.setGravity(moon);
  popStyle();
  
  pushStyle();
  stroke(#DEDEDE);
  fill(#8B8787);
  moon.applyForce(earth.getGravity());
  //moon.applyForce(sun.getGravity());
  moon.update();
  moon.display();
  popStyle();

}