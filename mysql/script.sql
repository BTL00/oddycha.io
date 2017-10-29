-- ten skrypt zwraca posortowane roslinki. ID wynikowe jest argumentem ostatniego zapytania.
SELECT DISTINCT p.NAME, p.DESCRIPTION, p.ID
FROM GPS_ZONE gz, GPS_ZONE_POLUTION_FACTOR_REL gprel, POLUTION_FACTOR pf, PLANT_POLUTION_FACTOR_REL ppfrel, PLANT p
WHERE gz.ID = gprel.GPS_ZONE_ID
AND gprel.POLUTION_FACTOR_ID = pf.ID
AND ppfrel.POLUTION_FACTOR_ID = pf.ID
AND ppfrel.PLANT_ID = p.ID
AND gz.X1 <= 19.8 AND 19.8 <= gz.X2
AND gz.Y1 <= 50.01 AND 50.01 <= gz.Y2
ORDER BY gprel.FACTOR_VALUE_MAX DESC, gprel.FACTOR_VALUE_MEAN DESC;

--zapytanie zwracajace szkodliwe chemikalia w zaleznosci od roslinki
SELECT  pf.NAME, pf.DESCRIPTION
FROM POLUTION_FACTOR pf, PLANT_POLUTION_FACTOR_REL ppfrel
WHERE 
 ppfrel.POLUTION_FACTOR_ID = pf.ID
AND ppfrel.PLANT_ID = 1;