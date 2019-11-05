
let $a := collection("imovirtual")//items//item
for $e in $a//number_of_bathrooms[@num="4 ou mais"]

return replace value of node $e//*:number_of_bathrooms with 4
