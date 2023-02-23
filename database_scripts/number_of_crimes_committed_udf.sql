CREATE OR REPLACE FUNCTION udf_Grad_Number_Of_Crimes (gradID int)
RETURNS integer as $$
	
	SELECT COUNT(hit_id)
	FROM committed_grad_crimes
	WHERE hit_id = (SELECT hit_id FROM hitlist WHERE grad_id = gradID)

$$ language sql;