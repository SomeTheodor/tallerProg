program parcialE;

type subGenero = 1..7;
libro = record
	isbn:integer;
	cod:integer;
	gen:subGenero;
end;

dato = record
	cod:integer;
	cant:integer;
end;

datoV = record
	gen:subGenero;
	cant:integer;
end;
	
arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	d:dato;
end;

vector = array [subGenero] of datoV;

var vec:array [subGenero] of string = ('Literario','filosofia', 'arte', 'biologia', 'computacion', 'medicina', 'ingenieria');

procedure leerLibro(var l:libro);
begin
	l.isbn:= Random(1000);
	if l.isbn <> 0 then
	begin
		l.cod:= Random(300)+100;
		l.gen:= Random(7)+1;
	end;
end;

procedure cargarArbol(var a:arbol; d:libro);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.d.cod:= d.cod;
		nue^.d.cant:= 1;
		a:= nue;
	end
	else if a^.d.cod = d.cod then
		a^.d.cant:= a^.d.cant + 1
	else if d.cod < a^.d.cod then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 7 do
	begin
		v[i].gen:= i;
		v[i].cant:= 0; 
	end;
end;

procedure cargarEstructuras(var a:arbol; var v:vector);
var d:libro;
begin
	inicializarVector(v);
	leerLibro(d);
	while d.isbn <> 0 do
	begin
		cargarArbol(a,d);
		v[d.gen].cant:= v[d.gen].cant + 1;
		leerLibro(d);
	end;
end;

procedure ordenarVector(var v:vector);
var i,j,p:integer;
item:datoV;
begin
	for i:= 1 to 6 do
	begin
		p:= i;
		for j:= i+1 to 7 do
		begin
			if v[j].cant > v[p].cant then
				p:=j;
			item:= v[p];
			v[p]:= v[i];
			v[i]:= item;
		end;
	end;
end;

function genMayorCantLibros(v:vector):string;
begin
	ordenarVector(v);
	genMayorCantLibros:= v[1].gen;
end;

function cantAutores(a:arbol; izq,der:integer):integer;
begin
	if a = nil then
		cantAutores:= 0
	else if (a^.d.cod >= izq) and (a^.d.cod <= der) then
		cantAutores:= cantAutores(a^.hi,izq,der) + 1 + cantAutores(a^.hd,izq,der)
	else if a^.d.cod < izq then
		cantAutores:= cantAutores(a^.hd,izq,der)
	else if a^.d.cod > der then
		cantAutores:= cantAutores(a^.hi,izq,der);
end;

var a:arbol; cod1,cod2,autoresCant:integer;v:vector;
gen:string;
begin
	Randomize;
	a:=nil;
	autoresCant:=0;
	cod1:= Random(149) + 100;
	cod2:= Random(150) + 100;
	cargarEstructuras(a,v);
	autoresCant:= cantAutores(a,cod1,cod2);
	writeln('Cantidad de libros entre codigos ', cod1, ' y ', cod2, ': ', autoresCant);
	gen:= genMayorCantLibros(v);
	writeln('Genero con mayor cant de libros: ', gen);
end.
