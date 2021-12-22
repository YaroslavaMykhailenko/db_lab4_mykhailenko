-------------------------
-- Create Products table
-------------------------

CREATE TABLE Products
(
  prod_id    char(10)      UNIQUE NOT NULL ,
  prod_name  char(50)      NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  CONSTRAINT PK_Products PRIMARY KEY (prod_id)

);

--------------------------
-- Create Restaurants table
--------------------------

CREATE TABLE Restaurants
(
  rest_id       char(10)  UNIQUE NOT NULL ,
  rest_name     char(50)  NOT NULL ,
  CONSTRAINT PK_Restaurants PRIMARY KEY (rest_id)
);

--------------------------
-- Create Restaurants_Products table
--------------------------

CREATE TABLE Restaurants_Products
(
  rest_id       char(10)    NOT NULL REFERENCES Restaurants (rest_id),
  prod_id       char(10)    NOT NULL REFERENCES Products (prod_id),
  CONSTRAINT PK_Restaurants_Products PRIMARY KEY (rest_id,prod_id)
);


----------------------
-- Create Orders table
----------------------

CREATE TABLE Orders
(
  order_num    int           UNIQUE NOT NULL ,
  rest_id      char(10)      NOT NULL REFERENCES Restaurants (rest_id),
  order_date   date          NOT NULL ,
  CONSTRAINT PK_Orders PRIMARY KEY (order_num)
   
);

----------------------
-- Create OrderItems table
----------------------

CREATE TABLE OrderItems
(
  order_num    int           NOT NULL REFERENCES Orders (order_num),
  prod_id      char(10)      NOT NULL REFERENCES Products (prod_id),
  quantity     int           NOT NULL ,
  CONSTRAINT PK_OrderItems PRIMARY KEY (order_num, prod_id)
);