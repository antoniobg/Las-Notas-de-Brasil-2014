class DataLoader
  def self.position_loader
    positions = load_json_file('scripts/data/positions.json')
    positions.each do |position|
      Position.create position
      puts "Creada posición #{position["code"]}"
    end
    puts "Creadas #{Position.count} posiciones"
  end

  def self.teams_loader
    teams = load_json_file('scripts/data/teams.json')
    teams.each do |team|
      Team.create team
      puts "Creada equipo #{team["name"]}"
    end
    puts "Creados #{Team.count} equipos"
  end

  def self.squads_loader
    squads = load_json_file('scripts/data/squads.json')
    squads.each do |team_code, players|
      team = Team.find_by_iso_2(team_code)
      players.each do |player|
        position = Position.find_by_code(player["position"])
        Player.create do |new_player|
          new_player.name = player["name"]
          new_player.team = team
          new_player.position = position
          new_player.number = player["number"]
        end
      end
      puts "Añadidos los jugadores de #{team}"
    end
    puts "Completadas #{squads.size} plantillas"
  end


  def self.load_json_file(filename)
    JSON.parse( IO.read(filename) )
  end
end