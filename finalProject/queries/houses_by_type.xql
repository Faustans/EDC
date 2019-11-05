declare function local:houses-by-type($type) as element()*
{
let $abc := if($type = '1') then
  for $e in collection('imovirtual')//*:items//*:item
    where ((contains(lower-case($e//*:house_characteristics),"apartamento")and not(contains(lower-case($e//*:house_characteristics),"moradia"))) or (contains(lower-case($e//*:title),"apartamento")and not(contains(lower-case($e//*:title),"moradia"))) or (contains(lower-case($e//*:listing_description),"apartamento")and not(contains(lower-case($e//*:listing_description),"moradia"))))
  order by $e//*:house_cost
  return $e
else
 for $e in collection('imovirtual')//*:items//*:item
     where ((contains(lower-case($e//*:house_characteristics),"moradia")and not(contains(lower-case($e//*:house_characteristics),"apartamento"))) or (contains(lower-case($e//*:title),"moradia")and not(contains(lower-case($e//*:title),"apartamento"))) or (contains(lower-case($e//*:listing_description),"moradia")and not(contains(lower-case($e//*:listing_description),"apartamento"))))
  order by $e//*:house_cost
  return $e
return $abc
};

(:Verificar se tem a caracteristica mobilado:)
<house>
{ local:houses-by-type("0")} (:Moradia = 0  Apartamento = 1:)
</house>