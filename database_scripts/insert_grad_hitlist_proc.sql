CREATE OR REPLACE PROCEDURE insert_grad_into_hitlist(
grad_id int,
murder_method_id int,
body_disposal_method_id int,
hit_completion_status bit) 
LANGUAGE sql
AS $$
	INSERT INTO hitlist (grad_id, murder_method_id,
				body_disposal_method_id,
				hit_completion_status)
	VALUES		(grad_id,
				murder_method_id,
				body_disposal_method_id,
				hit_completion_status)
$$;
