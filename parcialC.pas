program parcialC;
type
sub_dia = 1..30;
envio = record
	codCliente: integer;
	dia: sub_dia;
	peso:real;
end;

lista = ^nodo;
nodo = record
	d:envio;
	sig:lista;
end;

arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	cod:integer;
	l:lista;
end;


procedure leerEnvio(var c:envio; var cod:integer);
begin
	c.codCliente:= Random(10000);
	if c.codCliente <> 0 then
	begin
		cod:= Random(2000);
		c.dia:= Random(30) + 1;
		c.peso:= Random(20000) / (Random(10)+1);
	end;
end;

procedure cargarLista(var l:lista; d:envio);
var nue:lista;
begin
	new(nue);
	nue^.d:= d;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarArbol(var a:arbol; d:envio; cod:integer);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.l:= nil;
		cargarLista(nue^.l,d);
		nue^.cod:= cod;
		a:= nue;
	end
	else if a^.cod = cod then
		cargarLista(a^.l,d)
	else if cod < a^.cod then
		cargarArbol(a^.hi,d,cod)
	else
		cargarArbol(a^.hd,d,cod);
end;

procedure generarArbol(var a:arbol);
var d:envio; cod:integer;
begin
	leerEnvio(d,cod);
	while d.codCliente <> 0 do
	begin
		cargarArbol(a,d,cod);
		leerEnvio(d,cod);
	end;
end;

function retornarEnvios(a:arbol; cod:integer):lista;
begin
	if a = nil then
		retornarEnvios:= nil
	else if a^.cod = cod then
		retornarEnvios:= a^.l
	else if cod < a^.cod then
		retornarEnvios:= retornarEnvios(a^.hi, cod)
	else
		retornarEnvios:= retornarEnvios(a^.hd,cod);
end;

procedure retornarMinMax(l:lista; var minPeso, maxPeso:real; var minCod, maxCod:integer);
begin
	if l <> nil then
	begin

		if minCod = -1 then
		begin
			minCod:= l^.d.codCliente;
			maxCod:= l^.d.codCliente;
			minPeso:= l^.d.peso;
			maxPeso:= l^.d.peso;
		end
		else 
		begin
			if l^.d.peso < minPeso then
			begin
				minCod:= l^.d.codCliente;
				minPeso:= l^.d.peso;
			end;
			if	l^.d.peso > maxPeso then
			begin
				maxCod:= l^.d.codCliente;
				maxPeso:= l^.d.peso;
			end;
		end;
		retornarMinMax(l^.sig,minPeso,maxPeso,minCod,maxCod);
	end;
end;

var a:arbol; minPeso,maxPeso:real;
minCod,maxCod,cod:integer;
listaEnv:lista;
begin
	Randomize;
	a:=nil;
	minPeso:= 999999;
	maxPeso:= -1;
	minCod:= -1;
	maxCod:= -1;
	generarArbol(a);
	cod:= Random(2000);
	listaEnv:= retornarEnvios(a,cod); 
	if listaEnv = nil then
		writeln('Lista vacia')
	else 
	begin
		writeln('Lista con datos');
		retornarMinMax(listaEnv,minPeso,maxPeso,minCod,maxCod);
	end;
end.
