create or replace view frequent_hangouts_view as
	select
		grad_id,
		"name",
		"surname",
		(
			select 
				json_agg(
					json_build_object(
						'hangout',
						(
							select
								"hangout_name"
							from public.hangouts h where h.hangout_id = fh.hangout_id 
						),
						'coordinates',
						(
							select 
								json_build_object(
									'longitude',
									"hangout_longitude",
									'latitude',
									"hangout_latitude"
									) 
							from public.hangouts h where h.hangout_id = fh.hangout_id
						)
					) 
				) from public.frequent_hangout fh where fh.grad_id = gi.grad_id  
		) as frequent_hangouts 
		
	from public.grad_information gi