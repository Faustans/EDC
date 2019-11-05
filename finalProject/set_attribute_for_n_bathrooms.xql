
let $a := collection("imovirtual")//items//item
for $e in $a//number_of_bathrooms[@num="4 ou mais"]

return insert node attribute {'num'} {'4 ou mais'} into $e//number_of_bathrooms
