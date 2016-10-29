require 'pry'

def check_trip( start, target, stations, station_links, possible_stations = [], visited_stations = [] )

  # Initialize the possible stations to be visit
  # and the visited stations
  unless visited_stations.include?( start )
    possible_stations = station_links[start]
    visited_stations << start
  end

  # check whether the target include inside the possible stations if yes return Possible
  # else if no more possible station to go return Impossible
  # else push the first possible station which is the current station to the visited stations
  # then get the links on the current station and append it to the list of possible stations
  # if the current station links is empty return Impossible as no more link to go
  # then the two condition are doing the same, just does I want to get the difference between the two array
  # after that do the recursion
  if possible_stations.include?( target )
    return "Possible"
  elsif possible_stations.empty?
    return "Impossible"
  else
    current_station = possible_stations.shift
    visited_stations << current_station
    station_links[current_station]  ? current_station_link = station_links[current_station] : current_station_link = []
    if current_station_link.empty?
      return "Impossible"
    elsif current_station_link.length >= visited_stations.length
      possible_stations.concat(current_station_link.concat(visited_stations).uniq).uniq!
    else
      possible_stations.concat(visited_stations.concat(current_station_link).uniq).uniq!
    end
    check_trip(start,target,stations, station_links, possible_stations, visited_stations )
  end
end

stations = ["ADL", "BRI", "MEL", "SYD"]
links = {"ADL" => ["MEL"], "MEL" => ["ADL", "SYD"],  "SYD" => ["BRI"]}
puts check_trip( "ADL", "BRI", stations, links )
