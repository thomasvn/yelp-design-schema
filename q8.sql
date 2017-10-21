/*
  List California businesses that have more than 10 reviews and all of them are
  “5 stars”. Order by the number of reviews received (decreasing), and bid
  (i.e. business id, increasing). For each business, print bid, name and
  number of reviews.
*/
SELECT B.BusinessID, B.Name, B.ReviewCount
FROM Business B
INNER JOIN Review R ON B.BusinessID = R.BusinessID
WHERE B.State = 'CA'
GROUP BY B.BusinessID, B.Name, B.ReviewCount
HAVING AVG(R.Rating) = 5 AND COUNT(*) > 10
ORDER BY B.ReviewCount DESC, B.BusinessID ASC;
