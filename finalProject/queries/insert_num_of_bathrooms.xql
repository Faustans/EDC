let $id := ""
let $bathrooms := ""
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node 
   <num_of_bathrooms>{$bathrooms}</num_of_bathrooms> after $e//*:number_of_rooms