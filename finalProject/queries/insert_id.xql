let $e := collection('imovirtual')//*:items//*:item
for $i in 1 to count($e)
return insert node element {'id'} {$i} as first into $e[$i]