declare function local:houses-by-listing_type($type) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:listing_type,$type)
order by $e//*:house_cost
return $e};

<house>
{ local:houses-by-listing_type("vacation")}
</house>


