/*
   Find every business in California that has the word “Coffee” (case-sensitive)
   in its name but is not classified as a coffee place (i.e. has no word
   “Coffee” in any of its categories). List the business id, bid, and name
   in ascending bid order.
*/
SELECT B.BusinessID, B.Name, C.BusinessCategoryID
FROM Business B, BusinessCategory C
WHERE B.Name LIKE "%Coffee%" AND NOT C.Type LIKE "%Coffee%"
ORDER BY B.BusinessID ASC
