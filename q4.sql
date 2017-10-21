/*
  List the top 10 businesses in San Jose, California for breakfast or brunch.
  “Top” means that it has the highest average number of stars among all businesses
  that have one category as “Breakfast & Brunch”. Sort by their scores and break
  ties with number of reviews received (decreasing), then bid (increasing). For
  each business, print its bid (business id), name, average number of stars, and
  number of reviews.
*/
SELECT B.BusinessID, B.Name, AVG(R.Rating) as AvgRating, B.ReviewCount
FROM Business B
INNER JOIN BusinessCategory C ON B.BusinessCategoryID = C.BusinessCategoryID
INNER JOIN Review R ON B.BusinessID = R.BusinessID
WHERE C.Name = 'Breakfast and Brunch' AND B.City = 'San Jose' AND B.State = 'CA' AND ROWNUM <= 11
GROUP BY B.BusinessID, B.Name, B.ReviewCount
ORDER BY AvgRating DESC, B.ReviewCount DESC, B.BusinessID ASC;
