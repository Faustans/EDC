declare function local:houses-by-certificate($certificate) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:energy_certificate,$certificate)
order by $e//*:house_cost
return $e};

<house>
{ local:houses-by-certificate("A+")}
</house>