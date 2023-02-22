CREATE OR REPLACE FUNCTION udfGradNumberOfCrimes (gradID int)
RETURNS integer as $$
	
	SELECT COUNT(hit_id)
	FROM commited_grad_crimes
	WHERE hit_id = (SELECT COUNT(hit_id) FROM hitlist WHERE grad_id = gradID)

$$ language sql;