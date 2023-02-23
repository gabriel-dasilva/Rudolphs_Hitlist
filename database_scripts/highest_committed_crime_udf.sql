CREATE OR REPLACE FUNCTION udf_Highest_Committed_Crime ()
RETURNS text as $$
	DECLARE
		crime_id int;
		crime text;
	BEGIN
		SELECT grad_crime_id, COUNT(grad_crime_id) as num_crimes
		INTO crime_id
		FROM committed_grad_crimes
		GROUP BY grad_crime_id
		ORDER BY num_crimes DESC;
		
		SELECT crime_description
		INTO crime
		FROM lookup_grad_crimes
		WHERE grad_crime_id = crime_id;
		
		RETURN crime;
	END;
$$ language plpgsql;