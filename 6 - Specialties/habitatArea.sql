/* As a young naturalist, you've been studying the inhabitants of the nearby woods for the past several months. 
You've just come across some footprints you've never seen before. 
To learn more about the habitat of the animal that left them, you marked the footprints locations on your map.

The information about the places where the animal left its footprints is stored in the table places. Here is its structure:

x: the x-coordinate of the place;
y: the y-coordinate of the place.
It is guaranteed that pairs (x, y) are unique.

Now you want to find the area of the animal's habitat. 
You decided that the convex hull of the marked points is a good first approximation of the habitat, 
so you want to find the area of this hull.

Given the places table, write a select statement which returns only one column area and consists of a single row:
 the area of the convex hull. It is guaranteed that the resulting area is greater than 0.*/

CREATE PROCEDURE solution()
BEGIN
	SELECT  
	/*Returns a double-precision number indicating the area of the Polygon or MultiPolygon argument*/
	ST_Area(
		/*Returns a geometry that represents the convex hull of the geometry value g*/
		ST_ConvexHull(
			ST_MPointFromText(
				/*Constructs a geometry value of any type using its WKT representation and SRID.*/
				CONCAT('MULTIPOINT(', GROUP_CONCAT(CONCAT_WS(' ', x, y)), ')')))) 
				AS area
    FROM places;
END
