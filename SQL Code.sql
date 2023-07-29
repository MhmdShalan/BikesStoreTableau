SELECT o.order_id,
CONCAT(cu.first_name, ' ',cu.last_name) customers,
cu.city,
cu.state,
order_date,
SUM(quantity) total_units,
SUM(quantity * it.list_price) Revenue,
product_name,
cat.category_name,
brand_name,
store_name,
CONCAT(sta.first_name, ' ',sta.last_name) Sales_reps
	FROM [BikeStores].[sales].[orders] o
	JOIN [BikeStores].[sales].customers cu ON cu.customer_id = o.customer_id
	JOIN [BikeStores].[sales].order_items it ON o.order_id = it.order_id
	JOIN [BikeStores].[production].products pr ON it.product_id = pr.product_id
	JOIN [BikeStores].[production].categories cat ON cat.category_id = pr.category_id
	JOIN [BikeStores].[sales].stores sto ON sto.store_id = o.store_id
	JOIN [BikeStores].[sales].staffs sta ON sta.staff_id = o.staff_id
	JOIN [BikeStores].[production].[brands] br ON br.brand_id =  pr.brand_id

GROUP BY o.order_id, CONCAT(cu.first_name,' ',cu.last_name) ,cu.city,cu.state,order_date ,
		product_name,category_name,store_name , CONCAT(sta.first_name,' ',sta.last_name), brand_name