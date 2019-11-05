import module namespace funcs = "com.funcs.my.index" at "funcs_library.xq";

(:Usado, Renovado, Novo, Em construção, Para recuperar:)
(:Empty elem or function:)
(:{ funcs:houses-by-condition("Usado",<elem></elem>)}:)
<house>
{ funcs:houses-by-condition("Usado",funcs:houses-by-area(100,1,<node></node>))}

</house>