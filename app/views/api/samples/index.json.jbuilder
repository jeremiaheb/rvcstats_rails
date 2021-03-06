json.array! @samples do |s|
	json.YEAR s.year
	json.REGION s.region
	json.STRAT s.strat
	json.PROT s.prot
	json.MPA_NR s.mpa_nr
	json.PRIMARY_SAMPLE_UNIT s.primary_sample_unit
	json.STATION_NR s.station_nr
	json.LAT_DEGREES s.lat_degrees
	json.LON_DEGREES s.lon_degrees
	json.SPECIES_CD s.animal.species_cd
	json.TIME_SEEN s.time_seen
	json.UNDERWATER_VISIBILITY s.underwater_visibility
	json.DEPTH s.depth
	json.LEN s.len
	json.NUM s.num
end
