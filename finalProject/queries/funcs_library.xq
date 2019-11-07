module namespace funcs = "com.funcs.my.index";

(: 
Inputs: String "Renovado" || "Novo" || "Usado" || "Em construção" || "Para Recuperar"
Returns all the houses with the input condition
:)
declare function funcs:houses-by-condition($condition as xs:string, $INPUT, $valid) as element()*
{
  (:let $abc := fn:exists($INPUT//*:house_condition):)
  let $abc := if($valid = 1) then 
  for $e in $INPUT
    where (contains($e//*:house_condition,$condition))
  order by $e//*:house_cost
  return $e
  else
  for $e in collection('imovirtual')//*:items//*:item
  where (contains($e//*:house_condition,$condition))
  order by $e//*:house_cost
  return $e
  return $abc
};
(:
Inputs: Double area , Int bigger-lesser = 0 or 1
                                          case 0: >= area
                                          case 1: <= area
Returns all the houses with bigger or lesser than input area
:)
declare function funcs:houses-by-area($area, $bigger-lesser, $INPUT,$valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
    where ((($e//*:effective_area >= $area) and ($bigger-lesser=0)) or ((($e//*:effective_area <= $area) and ($bigger-lesser=1))))
    return $e
   else
     for $e in collection('imovirtual')//*:items//*:item
    where ((($e//*:effective_area >= $area) and ($bigger-lesser=0)) or ((($e//*:effective_area <= $area) and ($bigger-lesser=1))))
    return $e
    return $abc
};

(:
  inputs: string num = 1 | 2 | 3 | 4 ou mais
  returns all the houses with num bathrooms
:)
declare function funcs:houses-by-bathrooms($num, $INPUT, $valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
    where (($e//*:number_of_bathrooms = $num) or ($e//*:number_of_bathrooms[@num='4 ou mais'] and $num='4+'))
         order by $e//*:house_cost
      return $e
   else
     for $e in collection('imovirtual')//*:items//*:item
        where (($e//*:number_of_bathrooms = $num) or ($e//*:number_of_bathrooms[@num='4 ou mais'] and $num='4+'))
         order by $e//*:house_cost
      return $e
    return $abc
};

(:
Input string certificate = "([a-gA-G](\+|-)?)|(Isento)"
returns all the houses with the input certificate
:)
declare function funcs:houses-by-certificate($certificate, $INPUT, $valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
    where contains($e//*:energy_certificate,$certificate)
order by $e//*:house_cost
return $e
   else
     for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:energy_certificate,$certificate)
order by $e//*:house_cost
return $e
    return $abc
};

(:
  Inputs: String type = "buy"| "rent" | "vacation"
  Returns all the houses with input type
:)
declare function funcs:houses-by-listing-type($type, $INPUT, $valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
   where contains($e//*:listing_type,$type)
order by $e//*:house_cost
return $e
   else
     for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:listing_type,$type)
order by $e//*:house_cost
return $e
    return $abc
};

(:
  Inputs: double price-low, price-high
  Returns all the houses in the defined range
:)
declare function funcs:houses-by-price-range($price-low, $price-high, $INPUT, $valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
   where (($e//*:house_cost >= $price-low) and ($e//*:house_cost <= $price-high))
    return $e
   else
      for $e in collection('imovirtual')//*:items//*:item
    where (($e//*:house_cost >= $price-low) and ($e//*:house_cost <= $price-high))
    return $e
    return $abc
};

(:
  Inputs: String region = "Some District"
  Returns all the houses in the input region
:)
declare function funcs:houses-by-region($region, $INPUT, $valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
   where contains($e//*:house_district,$region)
order by $e//*:house_cost
return $e
   else
      for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:house_district,$region)
order by $e//*:house_cost
return $e
    return $abc
};

(:
  Inputs: byte rooms
  Returns all the houses with the input number of rooms
:)
declare function funcs:houses-by-rooms($rooms, $INPUT,$valid) as element()*
{    
 let $abc :=  if($valid = 1) then 
  for $e in $INPUT
   where $e//*:number_of_rooms=$rooms
order by $e//*:house_cost
return $e
   else
   for $e in collection('imovirtual')//*:items//*:item
where $e//*:number_of_rooms=$rooms
order by $e//*:house_cost
return $e
    return $abc
};

(:
Houses by characteristics
Inputs int type = 0 or 1
                  case 0: returns all the "Não mobilado" houses
                  case 1: returns all the "Mobilado" houses
:)
declare function funcs:houses-by-characteristics($type, $INPUT, $valid) as element()*
{
  let $zzz := if($valid = 1) then 
  let $abc := if($type = '1') then
  for $e in $INPUT
    where (not (contains($e//*:house_characteristics,"Não mobilado")) and contains($e//*:house_characteristics,"Mobilado") or contains($e//*:title,"Mobilado")) or contains($e//*:listing_description,"Mobilado")
  order by $e//*:house_cost
  return $e
else
 for $e in $INPUT
    where (contains($e//*:listing_description,"Não mobilado") or contains($e//*:title,"Não Mobilado") or contains($e//*:house_characteristics,"Não Mobilado"))
  order by $e//*:house_cost
  return $e
return $abc
  else
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
  return $zzz
};

(:
Inputs type: case '0': returns all "moradias"
             case '1': returns all "apartments"
:)
declare function funcs:houses-by-type($type, $INPUT, $valid) as element()*
{
  (:let $abc := fn:exists($INPUT//*:house_condition):)
  let $zzz := if($valid = 1) then 
  let $abc := if($type = '1') then
  for $e in $INPUT
    where ((contains(lower-case($e//*:house_characteristics),"apartamento")and not(contains(lower-case($e//*:house_characteristics),"moradia"))) or (contains(lower-case($e//*:title),"apartamento")and not(contains(lower-case($e//*:title),"moradia"))) or (contains(lower-case($e//*:listing_description),"apartamento")and not(contains(lower-case($e//*:listing_description),"moradia"))))
  order by $e//*:house_cost
  return $e
else
 for $e in $INPUT
     where ((contains(lower-case($e//*:house_characteristics),"moradia")and not(contains(lower-case($e//*:house_characteristics),"apartamento"))) or (contains(lower-case($e//*:title),"moradia")and not(contains(lower-case($e//*:title),"apartamento"))) or (contains(lower-case($e//*:listing_description),"moradia")and not(contains(lower-case($e//*:listing_description),"apartamento"))))
  order by $e//*:house_cost
  return $e
return $abc
  else
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
  return $zzz
};

(: Returns all the houses data set:)
declare function funcs:get-all-data()
{
  for $e in collection('imovirtual')//*:items//*:item

return $e

};

declare function funcs:house-by-id($id)
{
  for $e in collection('imovirtual')//*:items//*:item
  where($e//*:id = $id)
  return $e

};

declare function funcs:get-last-house-id(){
  let $e := collection('imovirtual')//*:items//*:item//*:id
  return $e[last()]
};


