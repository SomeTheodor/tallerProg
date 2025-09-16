program parcialP;

type compra = record
	codComida,cod:integer;
	cat:string;
end;

dato = record
	cod:integer;
	cant:integer;
end;

datoV = record
	cat:string;
	cant:integer;
end;

arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	d:dato;
end;

vector = array [1..5] of datoV;

var vec:array [1..5] of string = ('Full','Super','Media','Normal','Basica');

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 5 do
	begin
		v[i].cat:= vec[i];
		v[i].cant:= 0;
	end;
end;

procedure leerCompra(var c:compra);
begin
	c.cod:= Random(200);
	if c.cod <> 0 then
	begin
		c.cat:= vec[Random(5)+1];
		c.codComida:= Random(20)+1;
	end;
end;

procedure cargarArbol(var a:arbol;d:compra);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.d.cod:= d.codComida;
		nue^.d.cant:= 1;
		a:= nue;
	end
	else if a^.d.cod = d.codComida then
		a^.d.cant:= a^.d.cant + 1
	else if d.codComida < a^.d.cod then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure cargarVector(var v:vector; d:compra);
var ok:boolean; i:integer;
begin
	i:= 1;
	ok:= false;
	while ok <> true do
	begin
		if v[i].cat = d.cat then
		begin
			v[i].cant:= v[i].cant + 1;
			ok:= true;
		end
		else
			i:= i+1;
	end;
end;

procedure cargarEstructuras(var a:arbol;var v:vector);
var d:compra;
begin
	leerCompra(d);
	inicializarVector(v);
	a:= nil;
	while d.cod <> 0 do
	begin
		cargarArbol(a,d);
		cargarVector(v,d);
		leerCompra(d);
	end;
end;

function buscarCantComida(a:arbol; cod:integer):integer;
begin
	if a = nil then
		buscarCantComida:=0
	else if a^.d.cod = cod then
		buscarCantComida:= a^.d.cant
	else if cod < a^.d.cod then
		buscarCantComida:= buscarCantComida(a^.hi,cod)
	else
		buscarCantComida:= buscarCantComida(a^.hd,cod);
end;

procedure ordenarVector(var v:vector; var cat:string);
var i,j,p:integer;
item:datoV;
begin
	for i:= 1 to 4 do
	begin
		p:= i;
		for j:= i+1 to 5 do
		begin
			if v[j].cant < v[p].cant then
				p:= j;
		end;
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;	
	end;
	cat:= v[5].cat;
end;

var a:arbol; v:vector; cod,i:integer; cat:string; 
begin
	Randomize;
	cod:= Random(20)+1;
	cargarEstructuras(a,v);
	for i:= 1 to 5 do
	begin
		writeln('Cat: ',v[i].cat);
		writeln('Cant: ', v[i].cant);
	end;
	ordenarVector(v,cat);
	writeln('----------------------------');
	writeln('Mayor categoria: ', cat);
	writeln('----------------------------');
	for i:= 1 to 5 do
	begin
		writeln('Cat: ',v[i].cat);
		writeln('Cant: ', v[i].cant);
	end;
	writeln('----------------------------');
	writeln('Cant de comida de cod ', cod, ' es: ', buscarCantComida(a,cod));
	writeln('----------------------------');
end.
