declare function local:get-all-data()
{
for $e in collection('imovirtual')//*:items//*:item

return $e};

<house>
{ local:get-all-data()}
</house>