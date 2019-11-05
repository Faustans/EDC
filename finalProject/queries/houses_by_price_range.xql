declare function local:houses-by-price($price-low as xs:double, $price-high as xs:double)
{
    
  for $e in collection('imovirtual')//*:items//*:item
    where (($e//*:house_cost >= $price-low) and ($e//*:house_cost <= $price-high))
    return $e
};

<house>
{ local:houses-by-price(69450,69600)}
</house>

