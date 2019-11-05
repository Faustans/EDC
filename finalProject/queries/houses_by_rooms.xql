declare function local:houses-by-rooms($rooms) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:number_of_rooms,$rooms)
order by $e//*:house_cost
return $e};

<house>
{ local:houses-by-rooms("0")}
</house>