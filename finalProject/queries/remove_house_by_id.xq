
 let $id := ""
 for $e in collection('imovirtual')//*:items //*:item
   where contains($e//*:id,$id)
 return delete node $e