with id_table as 
	(select id, '["James","John","Jimmy","Jessica","Jeffrey","Jonathan","Justin","Jaclyn","Jodie"]'::text as names
	from generate_series(1,100) id)

	select id, json_extract_array_element_text(names, id % 9), id % 9 as check 
	from id_table