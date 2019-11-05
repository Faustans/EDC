let $a := collection('imovirtual')//*:items//*:item
for $e in $a//*:house_location
(:let $b := tokenize(($e//*:house_location),'(, Aveiro|, Beja|, Braga|, Bragança|, Castelo Branco|, Coimbra|, Évora|, Faro|, Guarda |, Leiria |, Lisboa|, Portalegre |, Porto|, Santarém|, Setúbal|, Viana do Castelo|, Vila Real|, Viseu|, Angra do Heroísmo|, Funchal|, Horta|, Lamego|, Ponta Delgada)+'):)
let $b := tokenize(($e),',')
(:return $b[last()]:)
return insert node element {'house_district'} {$b[last()]} after $e

