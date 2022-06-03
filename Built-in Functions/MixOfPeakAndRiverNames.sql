SELECT PeakName, RiverName,
LOWER(CONCAT(PeakName,SUBSTRING(RiverName,2,LEN(RiverName)-1))) as Mix
FROM Peaks
JOIN Rivers ON RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix;