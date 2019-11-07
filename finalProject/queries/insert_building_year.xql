let $id := ""
let $year := ""
let $name := collection('imovirtual')//*:items//*:item//building_year
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node element {$name} {$year} into $e//*:building_year