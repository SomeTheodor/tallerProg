program parcialF;

type subMaterial = 1..8;
artesania = record
	dni: integer;
	codArtesania:integer;
	material:subMaterial;
end;

vec = record
	base: string;
	cant:integer;
end;
arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	dni:integer;
	cant:integer;
end;

vector = array [subMaterial] of vec;

var base: array [subMaterial] of string = ('Madera','yeso','ceramica','vidrio','acero','porcelana','lana','carton');

procedure  leerArtesania(var d:artesania);
begin
	d.dni:= Random(10000);
	if d.dni <> 0 then
	begin
		d.codArtesania:= Random(100) + 2000;
		d.material:= Random(8)+ 1;
	end;
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 8 do
	begin
		v[i].cant:= 0;
		v[i].base:= base[i];
	end;
end;

procedure cargarArbol(var a:arbol; d:artesania);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.dni:= d.dni;
		nue^.cant:= 1;
		a:= nue;
	end
	else if a^.dni = d.dni then
		a^.dni:= a^.dni + 1
	else if d.dni < a^.dni then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure cargarEstructuras(var a:arbol; var v:vector);
var d:artesania;
begin
	leerArtesania(d);
	while d.dni <> 0 do
	begin
		cargarArbol(a,d);
		v[d.material].cant:= v[d.material].cant + 1;
		leerArtesania(d);
	end;
end;

function dniMenorQue(a:arbol; dni:integer):integer;
begin
	if a = nil then
		dniMenorQue:= 0
	else if a^.dni < dni then
		dniMenorQue:= dniMenorQue(a^.hi,dni) + 1 + dniMenorQue(a^.hd,dni)
	else
		dniMenorQue:= dniMenorQue(a^.hi,dni);
end;

procedure ordenarVector(var v:vector; var base:string);
var i,j,p:integer;
item:vec;
begin
	for i:= 1 to 7 do
	begin
		p:= i;
		for j:= i+1 to 8 do
		begin
			if v[j].cant < v[p].cant then
				p:= j;
				item:= v[p];
				v[p]:=v[i];
				v[i]:= item;
		end;
	end;
	base:= v[8].base;
end;
var a:arbol;
v:vector;
dniMin,dni,i:integer;
matBase:string;
begin
	Randomize;
	dni:= Random(10000);
	a:=nil;
	inicializarVector(v);
	cargarEstructuras(a,v);
	dniMin:= dniMenorQue(a,dni);
	ordenarVector(v,matBase);
	for i:= 1 to 8 do
	begin
		writeln('Base: ', v[i].base);
		writeln('Cant: ', v[i].cant);
	end;
	writeln('Base con mayor cant: ', matBase);
	writeln('Cant de DNI menor que ', dni, ' : ', dniMin)
end.
