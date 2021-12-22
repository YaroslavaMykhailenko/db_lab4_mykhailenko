CREATE OR REPLACE FUNCTION rest_income(restaurant_name varchar(50)) RETURNS decimal(5,2) 
AS $$
	DECLARE income decimal(5,2);	
BEGIN 

   SELECT SUM(prod_price) INTO income
   FROM restaurants
   JOIN orders USING(rest_id)
   JOIN orderitems USING (order_num)
   JOIN products USING(prod_id)
   WHERE restaurants.rest_name = restaurant_name;
   
   RETURN income;
END;
$$ LANGUAGE 'plpgsql'; 

--SELECT rest_income('Kin Khao');