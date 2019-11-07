
  let $url 			 := "" 
  let $listtype 	:= ""
  let $title 		 := ""
  let $address 	 := ""
  let $district	 := ""
  let $cost			 := ""
  let $area			 := ""
  let $rooms			:= ""
  let $bathrooms	:= ""
  let $certificate:= ""
  let $condition	:= ""
  let $year			 := ""
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
 <number_of_bathrooms>{$bathrooms}</number_of_bathrooms>
 <energy_certificate>{$certificate}</energy_certificate>
 <house_condition>{$condition}</house_condition>
 <building_year>{$year}</building_year>
 <listing_description>{$description}</listing_description>
 <house_characteristics></house_characteristics>
 <img_urls>{$imgurl}</img_urls>
  </item>
) as last into $e
