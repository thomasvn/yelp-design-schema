/*
  List users that have been to more than 5 distinct states. Order by number of
  states traveled to (decreasing), break ties with uid (user id, increasing).
  For each user, list his/her uid, name and number of states traveled to.
*/
SELECT Y.YelpUserID, Y.FirstName, COUNT(DISTINCT(B.State)) AS NumStates
FROM YelpUser Y
INNER JOIN Review R ON Y.YelpUserID = R.YelpUserID
INNER JOIN Business B ON B.BusinessID = R.BusinessID
GROUP BY Y.YelpUserID, Y.FirstName
HAVING COUNT(DISTINCT(B.State)) > 5
ORDER BY NumStates DESC, Y.YelpUserID ASC;
