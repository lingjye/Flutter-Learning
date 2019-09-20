class Planet {
  String name, climate, terrain, gravity, population;
  int diameter;

  Planet({
    this.name,
    this.climate,
    this.terrain,
    this.gravity,
    this.population
  });

  Planet.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    climate = map['climate'];
    terrain = map['terrain'];
    gravity = map['gravity'];
    population = map['population'];
  }
}