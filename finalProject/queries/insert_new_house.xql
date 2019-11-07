
  let $url 			 := "" 
  let $listtype 		 := ""
  let $title 		 := ""
  let $address 	 := ""
  let $district	 := ""
  let $cost			 := ""
  let $area			 := ""
  let $rooms			:= ""
  let $description:= ""
  let $imgurl := ""
let $e :=  collection('imovirtual')//*:items
let $i := collection('imovirtual')//*:items//*:item
for $a in $e

return insert nodes(
<item>
 <id>{count($i)+1}</id>
 <listing_url>{$url}</listing_url>
 <listing_type>{$listtype}</listing_type>
 <title>{$title}</title>
 <house_location>{$address}</house_location>
 <house_district>{$district}</house_district>
 <house_cost>{$cost}</house_cost>
 <effective_area>{$area}</effective_area>
 <number_of_rooms>{$rooms}</number_of_rooms>
 <listing_description>{$description}</listing_description>
 <house_characteristics></house_characteristics>
 <img_urls>{$imgurl}</img_urls>
  </item>
) as last into $e
