let $a := collection("imovirtual")//*:items
for $e in $a//*:item//*:effective_area


return replace value of node $e with translate($e,',','.')
