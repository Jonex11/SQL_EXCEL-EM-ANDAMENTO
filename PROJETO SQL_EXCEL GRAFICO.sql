
create or alter view VENDAS_INTERNET as 
SELECT 
fis.SalesOrderNumber as 'Nº DO PEDIDO',
fis.OrderDate as 'DATA PEDIDO',
dpc.EnglishProductCategoryName as 'CATEGORIA PEDIDO',
dc.FirstName + '' +LastName as	'NOME CLIENTE',
SalesTerritoryCountry as 'PAÍS',
fis.OrderQuantity as 'QTD. VENDIDA',
fis.TotalProductCost as 'CUSTO DA VENDA',
fis.SalesAmount as 'RECEITA VENDA'
FROM FactInternetSales fis
inner join DimProduct dp on fis.ProductKey = dp.ProductKey
	inner join DimProductSubcategory dps on dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		inner join DimProductCategory dpc on dps.ProductCategoryKey = dpc.ProductCategoryKey
inner join DimCustomer dc on fis.CustomerKey = dc.CustomerKey
inner join DimSalesTerritory dst on fis.SalesTerritoryKey = dst.SalesTerritoryKey
where year (OrderDate) = 2013


select * from VENDAS_INTERNET