json.families @families do |family|
	json.id family.id
	json.family_name family.family_name
	json.common_name family.common_name ? family.common_name : nil
end