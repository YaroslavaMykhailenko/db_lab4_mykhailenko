--тригер, который переводит в нижний регистр название новых продуктов

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



--DROP TRIGGER insertion_prod_name ON products

-- INSERT INTO Products(prod_id, prod_name, prod_price) VALUES('FNG487', 'Red wine', 17.90);
-- Select * from Products
