declare function local:houses-by-bathrooms($num) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where (($e//*:number_of_bathrooms = $num) or ($e//*:number_of_bathrooms[@num='4 ou mais'] and $num='4+'))
order by $e//*:house_cost
return $e};

(:Aceita como input casas de banho de 1 a 4 ou 4+:)
<house>
{ local:houses-by-bathrooms("4+")}
</house>