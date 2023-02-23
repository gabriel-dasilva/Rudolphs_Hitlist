CREATE OR REPLACE PROCEDURE get_hit_completion_status(grad_name varchar) 
LANGUAGE sql
AS $$
	SELECT hit_completion_status
	FROM hitlist AS h
  	INNER JOIN grad_information AS g
    ON h.grad_id = g.grad_id
	WHERE g.name = grad_name
$$;
