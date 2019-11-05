let $a := collection("imovirtual")//*:items
for $e in $a//*:item//*:house_cost

return replace value of node $e with translate($e,',','.')
