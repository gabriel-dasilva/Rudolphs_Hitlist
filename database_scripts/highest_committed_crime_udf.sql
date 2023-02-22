CREATE OR REPLACE FUNCTION udfHighestCommittedCrime ()
RETURNS text as $$
	DECLARE
		cri_id int;
		crime text;
	BEGIN
		SELECT COUNT(grad_crime_id)
		INTO cri_id
		FROM commited_grad_crimes
		GROUP BY grad_crime_id;
		
		SELECT crime_description
		INTO crime
		FROM lookup_grad_crimes
		WHERE grad_crime_id = cri_id;
		
		RETURN crime;
	END;
$$ language plpgsql;