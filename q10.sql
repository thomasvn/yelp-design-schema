/*
  Find the businesses whose average rating was raised by more than 1 stars from
  May 2011 to June 2011. Order your results by the magnitude of the jump
  (largest, first), then business names (increasing) and id (increasing).
  Print the first 10 if there are more than 10. For each business, print its bid
  (i.e.business id), name and jump magnitude.
*/
SELECT B.BusinessID, B.Name, EVAL(BusMay.AvgRating - BusJune.AvgRating) as JumpMagnitude
FROM Business B
INNER JOIN (
    SELECT B.BusinessID, AVG(R.rating) as AvgRating
    FROM Business B,
    INNER JOIN Review R on B.BusinessID = R.BusinessID
    GROUP BY B.BusinessID
    WHERE R.PublishDate < 'May 2011'
) as BusMay
ON B.BusinessID = BusMay.BusinessID
INNER JOIN (
    SELECT B.BusinessID, AVG(R.rating) as AvgRating
    FROM Business B,
    INNER JOIN Review R on B.BusinessID = R.BusinessID
    GROUP BY B.BusinessID
    WHERE R.PublishDate < 'June 2011' -- TODO: Find Unix Timestamp
) as BusJune
ON B.BusinessID = BusJune.BusinessID
WHERE EVAL(BusMay.AvgRating - BusJune.AvgRating) >= 1
GROUP BY B.BusinessID
ORDER BY JumpMagnitude DESC;



-- Note this doesnt owrk because in the db date is a varchar NOT a date
