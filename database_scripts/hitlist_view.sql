 create or replace view hitlist_view as
	select 
		hitlist_id,
		grad_id,
		(hit_completion_status & b'1' <> b'0') as hit_completion_status,
		(
			select
				"name"
			from public.grad_information gi where gi.grad_id = h.grad_id 
		) as grad_name,
		(
			select
				"surname"
			from public.grad_information gi where gi.grad_id = h.grad_id 
		) as grad_surname,
		(
			select
				json_build_object(
					'longitude',
					"home_location_longitude",
					'latitude',
					"home_location_latitude"
					)
			from public.grad_information gi where gi.grad_id = h.grad_id
		) as grad_coordinates,
		(
			select
				"method_description"
			from public.lookup_murder_method lmm where lmm.murder_method_id  = h.murder_method_id 
		) as murder_method,
		(
			select
				"disposal_method_description"
			from public.lookup_disposal_method ldm where ldm.disposal_method_id  = h.disposal_method_id
		) as disposal_method,
		(
			select json_agg(
				json_build_object(
					'crime',
					(
						select
							"crime_description" 
						from public.lookup_crime lc where lc.crime_id = lcc.crime_id
					)
				)
			) from public.lookup_crime_combination lcc where lcc.hitlist_id = h.hitlist_id 
		)
	from public.hitlist h  