--функция

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

--процедура

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

--тригер

CREATE TRIGGER insertion_prod_name
AFTER INSERT ON products
FOR EACH ROW EXECUTE FUNCTION to_lower_prod_name();


CREATE OR REPLACE FUNCTION to_lower_prod_name() RETURNS trigger AS
$$
     BEGIN
          UPDATE products 
          SET prod_name = lower(prod_name) WHERE products.prod_name = NEW.prod_name; 
      RETURN NULL; 
     END;
$$ LANGUAGE 'plpgsql';



-- DROP TRIGGER insertion_prod_name ON products

-- INSERT INTO Products(prod_id, prod_name, prod_price) VALUES('FNG487', 'Red wine', 17.90);
-- DELETE FROM Products where prod_id = 'FNG487';
-- Select * from Products



