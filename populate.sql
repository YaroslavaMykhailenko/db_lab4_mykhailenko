--Populate Products table

INSERT INTO Products(prod_id, prod_name, prod_price)
VALUES	('BRS01', 'Mint Sauce', 0.5),
	  	('BRS02', 'Lime Pickle', 0.5),
	  	('BRS03', 'Aloo Chaat', 4.95),
	  	('DLL04', 'Chicken Chaat', 4.95),
	  	('DLL05', 'Lamb Tikka Chilli Masala', 8.95),
	  	('DLL06', 'Mango Chutney', 0.5),
	  	('DLL07', 'Raggedy Ann', 4.95),
	  	('FNG08', 'Vindaloo', 7.95),
	  	('FNG09', 'Onion Chutney', 0.5),
	  	('FNG43', 'Madras', 7.95),
	  	('FNG15', 'Curry', 7.95),
	  	('FNG12', 'Prawn Biryani', 10.95),
	  	('FNG14', 'House Red wine', 10.95),
	  	('FNG42', 'House white wine', 17.95);

--Populate Restaurants table

INSERT INTO Restaurants(rest_id, rest_name)
VALUES	('BR01', 'Dinner in the Sky'),
		('BR02', 'La casa de papel'),
		('BR03', 'Kin Khao'),
		('BR04', 'Angler'),
		('BR05', 'Michael Mina'),
		('BR06', 'State Bird Provisions');


-- Populate Restaurants_Products table

INSERT INTO Restaurants_Products(rest_id, prod_id)
VALUES	('BR01','FNG43'),
		('BR01','FNG09'),
		('BR02','FNG14'),
		('BR02','FNG15'),
		('BR03','DLL04'),
		('BR03','BRS03'),
		('BR03','FNG12'),
		('BR04','BRS03'),
		('BR04','DLL05'),
		('BR05','DLL06'),
		('BR05','DLL05'),
		('BR05','DLL04'),
		('BR06','DLL05'),
		('BR06','BRS03'),
		('BR06','FNG15'),
		('BR06','BRS01');


-- Populate Orders table

INSERT INTO Orders(order_num, rest_id, order_date)
VALUES	('16118', 'BR01', TO_DATE('2019-08-03', 'yyyy-mm-dd')),
		('16117', 'BR06', TO_DATE('2019-08-03', 'yyyy-mm-dd')),
		('16087', 'BR02', TO_DATE('2019-08-02', 'yyyy-mm-dd')),
		('16083', 'BR02', TO_DATE('2019-08-02', 'yyyy-mm-dd')),
		('16066', 'BR02', TO_DATE('2019-07-31', 'yyyy-mm-dd')),
		('15955', 'BR04', TO_DATE('2019-07-25', 'yyyy-mm-dd')),
		('15578', 'BR03', TO_DATE('2019-06-30', 'yyyy-mm-dd')),
		('15028', 'BR03', TO_DATE('2019-05-25', 'yyyy-mm-dd')),
		('15029', 'BR01', TO_DATE('2019-08-03', 'yyyy-mm-dd'));


-- Populate OrderItems table

INSERT INTO OrderItems(order_num, prod_id, quantity)
VALUES	('16118', 'BRS02', 2),
		('16118', 'BRS03', 1),
		('16118', 'FNG08', 1),
		('16117', 'FNG08', 3),
		('16087', 'FNG08', 1),
		('16087', 'FNG09', 2),
		('16083', 'DLL07', 4),
		('16083', 'DLL05', 4),
		('16066', 'FNG12', 1),
		('15578', 'FNG12', 2),
		('15578', 'BRS01', 1),
		('15578', 'DLL05', 1),
		('15578', 'FNG14', 4),
		('15028', 'FNG42', 1);
