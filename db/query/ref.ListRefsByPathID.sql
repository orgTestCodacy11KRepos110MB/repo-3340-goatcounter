select
	coalesce(sum(total), 0) as count,
	max(ref_scheme)                as ref_scheme,
	ref                            as name
from ref_counts
where
	site_id = :site and
	path_id = :path and
	hour >= :start and hour <= :end
group by ref
order by count desc, ref desc
limit :limit offset :offset

