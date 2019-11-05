declare function local:houses-by-area($area as xs:double, $bigger-lesser as xs:integer)
{
  (:BOTH METHODS WORK ONE IS PRETTIER THAN THE OTHER :)
  (:let $abc := if ($bigger-lesser=0) then
    for $z in collection('imovirtual')//*:items//*:item
    where ($z//*:effective_area > $area)
    return $z
    else
    for $x in collection('imovirtual')//*:items//*:item
    where($x//*:effective_area < $area)
    return $x:)
    
  for $e in collection('imovirtual')//*:items//*:item
    where ((($e//*:effective_area >= $area) and ($bigger-lesser=0)) or ((($e//*:effective_area <= $area) and ($bigger-lesser=1))))
    return $e
};




<house>
{ local:houses-by-area(100,0)}
</house>

