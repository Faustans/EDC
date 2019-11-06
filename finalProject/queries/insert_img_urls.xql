let $id := ""
let $imgurl := ""
for $e in collection('imovirtual')//*:items//*:item
  where contains($e//*:id,$id)
  
  return insert node(
  <value>{$imgurl}</value>
) as first into $e//*:img_urls