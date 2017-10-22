/*
  Find the user with the highest sum of the ’useful’ votes that his/her reviews
  have attracted. If there is a tie in first place, list allsuch users, ordered
  by uid (i.e. user id). For each user, print his/her uid (i.e. userid), name,
  and usefulness count.
*/
SELECT *
FROM (
    SELECT R.YelpUserID, Y.FirstName, SUM(R.NumberOfUsefulReactions) AS NumUseful
    FROM Review R
    INNER JOIN YelpUser Y ON Y.YelpUserID = R.YelpUserID
    GROUP BY R.YelpUserID, Y.FirstName
    ORDER BY NumUseful DESC, R.YelpUserID DESC
)
WHERE ROWNUM < 3;
