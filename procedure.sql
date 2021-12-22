CREATE OR REPLACE PROCEDURE get_products(restaurant_name varchar(100)) 
LANGUAGE 'plpgsql'
AS $$

DECLARE quantity orderitems.quantity%TYPE;

BEGIN	
	SELECT SUM(orderitems.quantity) INTO quantity from restaurants
	JOIN orders USING(rest_id)
        JOIN orderitems USING (order_num)
        JOIN products USING(prod_id)
        WHERE restaurants.rest_name = restaurant_name
	GROUP BY(rest_name);
	RAISE INFO 'Restaurant: %,  Quantity of ordered products: %', restaurant_name, quantity;
END;
$$;

--Call get_products('La casa de papel')