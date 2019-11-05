declare function local:houses-by-region($region) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:house_district,$region)
order by $e//*:house_cost
return $e};

<house>
{ local:houses-by-region("Lisboa")}
</house>

