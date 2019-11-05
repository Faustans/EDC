declare function local:houses-by-condition($type) as element()*
{
let $abc := if($type = '1') then
  for $e in collection('imovirtual')//*:items//*:item
    where (not (contains($e//*:house_characteristics,"Não mobilado")) and contains($e//*:house_characteristics,"Mobilado") or contains($e//*:title,"Mobilado")) or contains($e//*:listing_description,"Mobilado")
  order by $e//*:house_cost
  return $e
else
 for $e in collection('imovirtual')//*:items//*:item
    where (contains($e//*:listing_description,"Não mobilado") or contains($e//*:title,"Não Mobilado") or contains($e//*:house_characteristics,"Não Mobilado"))
  order by $e//*:house_cost
  return $e
return $abc
};

(:Verificar se tem a caracteristica mobilado:)
<house>
{ local:houses-by-condition("0")} (:não mobilado = 0  mobilado = 1:)
</house>