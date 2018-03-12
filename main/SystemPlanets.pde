import java.util.List;
import java.util.Collection;

class SystemPlanets implements CelestialBody{
  Planet barycenter;
  HashMap<CelestialBody,Float> listPlanets;

  SystemPlanets(){
    barycenter = new Planet(
      "NoName",           // Name
      10f,                // Diameter
      0f,                 // Acceleration
      0f,                 // Velocity
      0f,   // Gravity
      0f,                 // Mass
      0f,                 // Theta
      new int[]{0,0});    // Fill Color / Stroke Color
    listPlanets = null;
  }
  
  SystemPlanets(Planet p,HashMap l){
    this.barycenter = p;
    this.listPlanets = l;
  }
  
  void addPlanet(CelestialBody c){
    if (listPlanets != null){
      listPlanets.put(c, c.getGravity());
    }
  }
  
  void addAllPlanet(HashMap l){
    listPlanets.putAll(l);
  }
  
  PVector getPosition(){
    if(this.barycenter != null){
      return this.barycenter.getPosition();
    }
    else return null;
  }
  
  public float getPositionX(){
    return this.barycenter.getPositionX();
  }
  
  public float getPositionY(){
     return this.barycenter. getPositionY();
  }
  
  CelestialBody getBarycenter(){
    if(this.barycenter != null){
      return this.barycenter;
    }
    else return null;
  }
  
  Collection getAllPlanets(){
    if(!listPlanets.isEmpty()){
      return this.listPlanets.entrySet();
    }
    return null;
  }
  
  int getListPlanetSize(){
    return listPlanets.size();
  }
  
  float getGravity(){
    return barycenter.getGravity();
  }
  
  void setPlanet(CelestialBody c, float m){
    listPlanets.put(c,m);
  }
  
  void setBarycenter(Planet p){
    this.barycenter = p;
  }
  
  void setPosition(PVector p){
    barycenter.setPosition(p);
  }
  
  void setDiameter(float diameter){
    barycenter.setDiameter(diameter);
  }
  
  void setVelocity(float velocity){
    barycenter.setVelocity(velocity);
  }
  
  void setGravity(float gravity){
    barycenter.setGravity(gravity);
  }
  
  void setGravity(Planet p){
    barycenter.setGravity(p);
  }
  
  void setAllGravity(){
    for(CelestialBody c : listPlanets.keySet()){
      if(c instanceof Planet)
      {
        Planet p = (Planet)c;
        barycenter.setGravity(p);
        float g = barycenter.getGravity();
        listPlanets.put(c,g);
      }
      else
      {
        if(c instanceof SystemPlanets)
        {
          SystemPlanets sp = (SystemPlanets)c;
          sp.setAllGravity();
        }
      }
    }
  }
  
  void setName(String s){
    barycenter.setName(s);
  }
  
  void setAcceleration(float acceleration){
    barycenter.setAcceleration(acceleration);
  }
  
  void setMass(float m){
    barycenter.setMass(m);
  }
  
  void display(){
    for(CelestialBody c : listPlanets.keySet()){
      pushMatrix();
      translate(barycenter.getPositionX(),barycenter.getPositionY());
      c.display();
      popMatrix();
    }
    barycenter.display();
  }
  
  void applyForce(float f){
    for(CelestialBody c : listPlanets.keySet()){
      c.applyForce(listPlanets.get(c));
    }
  }
  
  void update(){
    for(CelestialBody c : listPlanets.keySet()){
      c.update(); //<>//
    }
  }
}