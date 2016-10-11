Select player1, year 
from total_matches_by_year;

Select player1, year
from mendata_11
where player1 in
(
select player1 from
players_more_than_6
)
group by player1, year
order by 1,2;


matches_won_by_year
total_matches_by_year
win_percent_by_year
points_diff_by_year
join of 3 views
data_for_fg


Select a.player1, a.year, 'country', a.count,
from
total_matches_by_year a,
win_percent_by_year b,
points_diff_by_year c
where
a.player1 = b.player1 and
b.player1 = c.player1 and
a.year = b.year and
b.year = c.year;


update data_for_fg a
set country = 
(Select country1 from
(select player1, country1 from mendata_11
union
select player2, country2 from mendata_11) as foo
where a.player1 = foo.player1
);