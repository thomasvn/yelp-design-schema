/*
  List the top 5 burger restaurants (i.e. have the highest average number of
  stars) in San Jose,California. “Top” means that it has the highest score
  among all businesses in San Jose, California that have one category as
  “Burgers”. Sort by score (highest, first) and break ties with number of
  reviews by travelers (decreasing), then bid (increasing). For each restaurant,
  print its bid, name, score, and numberof traveler reviews received.
*/
SELECT B.BusinessID, B.Name, AVG(R.Rating) AS Score, B.ReviewCount
FROM Business B
INNER JOIN Review R ON B.BusinessID = R.BusinessID
INNER JOIN BusinessCategory C ON C.BusinessCategoryID = B.BusinessCategoryID
WHERE B.City = 'San Jose' AND B.State = 'CA' AND C.Name = 'Burgers'
GROUP BY B.BusinessID, B.Name, B.ReviewCount
ORDER BY Score DESC;

-- TODO: List the top 5
