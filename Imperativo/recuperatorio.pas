program recuImp;
type
	meses = 1..12;
	years = 2000..2024;
	rango = 1..35;
	
	resultado = record
		leg:integer;
		codMateria:integer;
		mes:meses;
		year:years;
		nota:integer;
	end;

	dato = record
		codMateria:integer;
		mes:meses;
		year:years;
		nota:integer;
	end;

lista = ^nodo;
nodo = record
	d:dato;
	sig:lista;
end;

arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	leg:integer;
	l:lista;
end;

vector = array [rango] of integer;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 35 do
		v[i]:= 0;
end;

procedure cargarLista(var l:lista; d:resultado);
var nue:lista;
begin
	new(nue);
	nue^.d.codMateria:= d.codMateria;
	nue^.d.mes:= d.mes;
	nue^.d.year:= d.year;
	nue^.d.nota:= d.nota;
	nue^.sig:= l;
	l:= nue; 
end;

procedure cargarArbol(var a:arbol; d:resultado);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.l:= nil;
		cargarLista(nue^.l,d);
		nue^.leg:= d.leg;
		a:= nue;
	end
	else if a^.leg = d.leg then
		cargarLista(a^.l,d)
	else if d.leg < a^.leg then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure leerResultado(var d:resultado);
begin
	d.codMateria:= Random(36);
	if d.codMateria <> 0 then
	begin
		d.leg:= Random(100);
		d.mes:= Random(12) + 1;
		d.year:= Random(24) + 2000;
		d.nota:= Random(10) + 1;
	end;
end;

procedure cargarEstructuras(var a:arbol; var v:vector; var ult:integer);
var d:resultado;
begin
	leerResultado(d);
	while d.codMateria <> 0 do
	begin
		cargarArbol(a,d);
		if d.nota < 4 then
			v[d.codMateria]:= v[d.codMateria] + 1;
		ult:= d.leg;
		leerResultado(d);
	end;
end;

function buscarLista(a:arbol; leg:integer):lista;
begin
	if a = nil then
		buscarLista:= nil
	else if a^.leg = leg then
		buscarLista:= a^.l
	else if leg < a^.leg then
		buscarLista:= buscarLista(a^.hi,leg)
	else
		buscarLista:= buscarLista(a^.hd,leg);
end;

function promEstudiante(a:arbol; leg:integer):integer;
var list:lista;
cant,prom:integer;
begin
	prom:= 0;
	cant:= 0;
	list:= buscarLista(a,leg);
	while list <> nil do
	begin
		if list^.d.nota > 4 then
		begin
			prom:= list^.d.nota + prom;
			cant:= cant + 1;
		end;
		list:=list^.sig;
	end;
	if cant > 0 then
		promEstudiante:= prom div cant
	else
		promEstudiante:= 0;
end;

function mayorCod(v:vector; var max:integer; i:integer):integer;
var cod:integer;
begin
	if i > 35 then
		mayorCod:= -1
	else 
	begin
		cod:= mayorCod(v,max,i+1);
		if v[i] > max then
		begin
			max:= v[i];
			mayorCod:= i;
		end
		else
			mayorCod:= cod;
	end;
end;

var a:arbol;
v:vector;
prom,codAplazo,max,ult:integer;
begin
	Randomize;
	max:=-1;
	a:= nil;
	cargarEstructuras(a,v,ult);
	prom:= promEstudiante(a,ult);
	codAplazo:= mayorCod(v,max,1);
	writeln('Promedio: ',prom);
	writeln('Cod con mayor aplazos: ', codAplazo);
end.
