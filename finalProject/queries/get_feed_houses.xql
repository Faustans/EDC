declare function local:get-feed-houses($page) as element()*
{
let $start := xs:integer($page) * 9 - 8
let $end 	:= xs:integer($page) * 9
  for $e in collection('imovirtual')//*:items//*:item
    where (($e//*:id >= $start) and ($e//*:id <= $end))
    return $e
};

<house>
{ local:get-feed-houses("2")}
</house>