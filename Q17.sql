-- Find the order with the maximum number of products


select t.order_id, sum(t.quantity) as size from (
    select order_id, quantity from Orders
    inner join Purchase
    on Orders.purchase_id = Purchase.id
    order by Orders.order_id
)as t
group by t.order_id
order by sum(quantity) desc
limit 1
;