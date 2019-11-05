declare function local:houses-by-condition($condition) as element()*
{
for $e in collection('imovirtual')//*:items//*:item
where (contains($e//*:house_condition,$condition))
order by $e//*:house_cost
return $e};

(:Usado, Renovado, Novo, Em construção, Para recuperar:)
<house>
{ local:houses-by-condition("Para recuperar")}
</house>