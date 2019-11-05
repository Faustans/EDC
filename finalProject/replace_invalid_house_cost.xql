
let $a := collection('imovirtual')//*:items//*:item
for $e in $a[*:house_cost]

return replace value of node $e//*:house_cost with 0
(:return replace value of node $e//*:number_of_bathrooms with 4:)
(:return insert node attribute {'value'} {'Preço sob consulta'} into $e//*:house_cost:)