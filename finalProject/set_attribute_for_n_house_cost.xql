
let $a := collection('imovirtual')//*:items//*:item
for $e in $a[*:house_cost]

return insert node attribute {'value'} {'Preço sob consulta'} into $e//*:house_cost