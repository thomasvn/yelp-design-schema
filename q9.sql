/*
  Find the businesses that got more than 50 5-star reviews from users that
  have only voted once. For each business, print its bid (i.e. business id),
  name and the number of reviews from such users. Order by the number of reviews
  received (decreasing), then business name (increasing) then bid (increasing).
*/
SELECT B.BusinessID, B.Name, B.ReviewCount
FROM Business B
INNER JOIN Review R ON B.BusinessID = R.BusinessID
GROUP BY B.BusinessID, B.Name, B.ReviewCount
HAVING AVG(R.Rating) = 5 AND COUNT(DISTINCT(R.YelpUserID)) > 50
ORDER BY B.ReviewCount DESC, B.Name ASC, B.BusinessID ASC;
