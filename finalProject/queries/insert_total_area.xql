let $id := ""
let $totalarea := ""
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node 
   <total_area>{$totalarea}</total_area> after $e//*:effective_area