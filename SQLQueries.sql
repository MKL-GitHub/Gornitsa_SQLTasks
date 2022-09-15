-- Выводит количество каждого материала на каждый заказ.
-- Формат вывода: | Наименование заказа | Материал | Количество |
SELECT
	 view_orders.name AS OrderName
	,view_modelcalc.Good_marking AS GoodMarking
	,SUM(view_modelcalc.qustore * view_orderitem.qu) AS GoodQuantity
FROM view_orders
INNER JOIN view_orderitem
ON view_orders.Idorder = view_orderitem.Idorder
INNER JOIN view_modelcalc
ON view_orderitem.Idorderitem = view_modelcalc.Idorderitem
GROUP BY
	 view_orders.name
	,view_modelcalc.Good_marking
ORDER BY
	view_orders.name
	,view_modelcalc.Good_marking

-- Выводит общее количество материалов на все заказы.
-- Формат вывода: | Материал | Количество |
SELECT
	view_modelcalc.Good_marking AS GoodMarking
	,SUM(view_orderitem.qu * view_modelcalc.qustore) AS Quantity
FROM view_orderitem
INNER JOIN view_modelcalc
ON view_orderitem.Idorderitem = view_modelcalc.Idorderitem
GROUP BY view_modelcalc.Good_marking
ORDER BY view_modelcalc.Good_marking

-- Выводит количество материала на изделие "Окно" для продавца Иванова.
-- Формат вывода: | Материал | Количество |
SELECT
	view_modelcalc.Good_marking AS GoodMarking
	,SUM(view_modelcalc.qustore * view_orderitem.qu) AS GoodQuantity
FROM view_orders
INNER JOIN view_orderitem
ON view_orders.Idorder = view_orderitem.Idorder
INNER JOIN view_modelcalc
ON view_orderitem.Idorderitem = view_modelcalc.Idorderitem
GROUP BY
	view_orders.Seller_name
	,view_orderitem.Name
	,view_modelcalc.Good_marking
HAVING 
	view_orders.Seller_name = N'Иванов' AND
	view_orderitem.Name = N'Окно'
ORDER BY view_modelcalc.Good_marking