/*
  For each state, give the most popular bar in that state. “Popular” means that
  it has the highest count of reviews, among all establishments that have one
  category as “Bars”, in said state. Sort by state name (increasing). In the
  remote case of a tie in first place, list all bars, in ascending bid order.
  More specifically, for each bar, print its bid (i.e. business id), name,
  number of reviews and state.
*/
SELECT B.State, B.BusinessID, B.Name, MAX(B.ReviewCount)
FROM Business B
INNER JOIN BusinessCategory C ON B.BusinessCategoryID = C.BusinessCategoryID
WHERE C.Name = 'Bars'
GROUP BY B.State, B.BusinessID, B.Name
ORDER BY B.State, B.BusinessID;

-- TODO: Limit to Bars
