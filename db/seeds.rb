mission_data = [
  {name: "Mars 2020", status: "pending", organization: "NASA"},
  {name: "Hayabusa2", status: "active", organization: "JAXA"},
  {name: "Chang'e 4", status: "pending", organization: "CNSA"}
]

organization_data = [
  {name: "National Aeronautics and Space Administration", abbreviation: "NASA"},
  {name: "Japan Aerospace Exploration Agency", abbreviation: "JAXA"},
  {name: "China National Space Administration", abbreviation: "CNSA"}
]

milestone_data = [
  {mission: "Mars 2020", name: "Launch", date: "31st Jul 2020"},
  {mission: "Hayabusa2", name: "Launch", date: "3rd Dec 2014"},
  {mission: "Hayabusa2", name: "Asteroid Rendezvous", date: "31st Jul 2018"},
  {mission: "Hayabusa2", name: "Earth Landing", date: "31st Dec 2020"},
  {mission: "Chang'e 4", name: "Launch", date: "31st Dec 2018"},
  {mission: "Chang'e 4", name: "Lunar Landing", date: "31st Dec 2018"}
]

organization_data.each do |data|
  Organization.find_or_create_by!(name: data[:name], abbreviation: data[:abbreviation])
end

mission_data.each do |data|
  mission = Mission.find_or_create_by!(name: data[:name], status: data[:status])
  mission.organizations << Organization.find_by(abbreviation: data[:organization])
  mission.save!
end

milestone_data.each do |data|
  mission = Mission.find_by(name: data[:mission])
  Milestone.find_or_create_by!(name: data[:name], date: DateTime.parse(data[:date]), mission: mission)
end
