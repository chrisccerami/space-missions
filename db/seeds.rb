milestone_data = [
  {mission: "Mars 2020", name: "Launch", date: "31st Jul 2020"},
  {mission: "Mars 2020", name: "Mars Approach", date: "31st Mar 2021"},
  {mission: "Hayabusa2", name: "Launch", date: "3rd Dec 2014"},
  {mission: "Hayabusa2", name: "Asteroid Rendezvous", date: "31st Jul 2018"},
  {mission: "Hayabusa2", name: "Earth Landing", date: "31st Dec 2020"},
  {mission: "Chang'e 4", name: "Launch", date: "31st Dec 2018"},
  {mission: "Chang'e 4", name: "Lunar Landing", date: "31st Dec 2018"},
  {mission: "Chang'e 5", name: "Launch", date: "31st Dec 2019"},
  {mission: "Chang'e 5", name: "Lunar Landing", date: "31st Dec 2019"},
  {mission: "OSIRIS-REx", name: "Launch", date: "8th Sep 2016"},
  {mission: "OSIRIS-REx", name: "Earth Flyby", date: "22nd Sep 2017"},
  {mission: "OSIRIS-REx", name: "Orbital Insertion", date: "31st Aug 2018"},
  {mission: "OSIRIS-REx", name: "Orbital Departure", date: "30th Mar 2021"},
  {mission: "OSIRIS-REx", name: "Earth Landing", date: "24th Sep 2023"}
]

require 'csv'
CSV.foreach("db/space_organizations.csv", headers: true) do |row|
  Organization.find_or_create_by!(name: row["English Name"], abbreviation: row["Abbreviation"])
end

CSV.foreach("db/space_missions.csv", headers: true) do |row|
  mission = Mission.find_or_create_by!(name: row["English Name"], status: row["Status"])
  organizations = Organization.where(abbreviation: row["Organization"].split("/"))
  mission.organizations = organizations
  mission.save!
end

milestone_data.each do |data|
  mission = Mission.find_by(name: data[:mission])
  Milestone.find_or_create_by!(name: data[:name], date: DateTime.parse(data[:date]), mission: mission)
end
