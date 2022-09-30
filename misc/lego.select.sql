Use LEGO

Select Part_Categories.name as CategoryName, 
	   count(Part_Categories.name) as Amount
	   from Parts, Part_Categories
where Parts.part_cat_id = Part_Categories.id
group by Part_Categories.name