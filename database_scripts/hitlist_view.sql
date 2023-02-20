create or replace view hitlist_view as
	select 
		h.hit_id,
		(hit_completion_status & b'1' <> b'0') as hit_completion_status,
		gi.grad_id,
		gi."name",
		gi.surname,
		json_build_object('longitude', gi.home_location_longitude, 'latitude', gi.home_location_latitude) as grad_coordinates,
		lmm.method_description,
		disposal_method_description,
		(
			select json_agg(
				json_build_object(
					'crime',
					(
						select
							"crime_description" 
						from public.lookup_grad_crimes lgc where lgc.grad_crime_id = cgc.grad_crime_id 
					)
				)
			) from public.commited_grad_crimes cgc where cgc.hit_id = h.hit_id  
		) as grad_crimes
	from public.hitlist h
	left join public.grad_information gi
		on h.grad_id = gi.grad_id
	left join public.lookup_body_disposal_method lbdm
		on lbdm.body_disposal_method_id = h.murder_method_id
	left join public.lookup_murder_method lmm
		on lmm.murder_method_id = h.murder_method_id; 