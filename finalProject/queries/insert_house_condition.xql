let $id := ""
let $condition := ""
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node 
   <house_condition>{$condition}</house_condition> into $e