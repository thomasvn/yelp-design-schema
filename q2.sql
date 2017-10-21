/*
   Find every business in California that has the word “Coffee” (case-sensitive)
   in its name but is not classified as a coffee place (i.e. has no word
   “Coffee” in any of its categories). List the business id, bcid, and name
   in ascending bid order.
*/
SELECT B.BusinessID, C.BusinessCategoryID, B.Name
FROM Business B
INNER JOIN BusinessCategory C ON B.BusinessCategoryID = C.BusinessCategoryID
WHERE B.Name LIKE '%Coffee%' AND C.Name NOT LIKE '%Coffee%'
ORDER BY B.BusinessID ASC;
