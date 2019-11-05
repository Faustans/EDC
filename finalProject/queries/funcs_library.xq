module namespace funcs = "com.funcs.my.index";


declare function funcs:houses-by-condition($condition as xs:string, $INPUT) as element()*
{
  (:let $abc := fn:exists($INPUT//*:house_condition):)
  let $abc := if(fn:exists($INPUT//*:house_condition)) then 
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

declare function funcs:houses-by-area($area as xs:double, $bigger-lesser as xs:integer, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
  for $e in $INPUT
    where ((($e//*:effective_area >= $area) and ($bigger-lesser=0)) or ((($e//*:effective_area <= $area) and ($bigger-lesser=1))))
    return $e
   else
     for $e in collection('imovirtual')//*:items//*:item
    where ((($e//*:effective_area >= $area) and ($bigger-lesser=0)) or ((($e//*:effective_area <= $area) and ($bigger-lesser=1))))
    return $e
    return $abc
};

declare function funcs:houses-by-bathrooms($num, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
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

declare function funcs:houses-by-certificate($certificate, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
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

declare function funcs:houses-by-listing-type($type, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
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

declare function funcs:houses-by-price-range($price-low as xs:double, $price-high as xs:double, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
  for $e in $INPUT
   where (($e//*:house_cost >= $price-low) and ($e//*:house_cost <= $price-high))
    return $e
   else
      for $e in collection('imovirtual')//*:items//*:item
    where (($e//*:house_cost >= $price-low) and ($e//*:house_cost <= $price-high))
    return $e
    return $abc
};

declare function funcs:houses-by-region($region, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
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

declare function funcs:houses-by-rooms($rooms, $INPUT) as element()*
{    
 let $abc :=  if(fn:exists($INPUT//*:effective_area)) then 
  for $e in $INPUT
   where contains($e//*:number_of_rooms,$rooms)
order by $e//*:house_cost
return $e
   else
   for $e in collection('imovirtual')//*:items//*:item
where contains($e//*:number_of_rooms,$rooms)
order by $e//*:house_cost
return $e
    return $abc
};

(:Houses by characteristics:)
declare function funcs:houses-by-characteristics($type, $INPUT) as element()*
{
  let $zzz := if(fn:exists($INPUT//*:house_condition)) then 
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

declare function funcs:houses-by-type($type as xs:string, $INPUT) as element()*
{
  (:let $abc := fn:exists($INPUT//*:house_condition):)
  let $zzz := if(fn:exists($INPUT//*:house_condition)) then 
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

