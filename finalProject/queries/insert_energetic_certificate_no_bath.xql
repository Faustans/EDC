let $id := ""
let $energetic := ""

for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  return insert node <energetic_certificate>{$energetic}</energetic_certificate> after $e//*:number_of_rooms
