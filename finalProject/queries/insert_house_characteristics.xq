
let $id := ""
let $characteristic := ""
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node(
  <value>{$characteristic}</value>
) as first into $e//*:house_characteristics