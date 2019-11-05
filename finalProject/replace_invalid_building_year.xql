
let $a := collection('imovirtual')//*:items//*:item
for $e in $a[*:building_year]



return replace value of node $e//*:building_year with 2001