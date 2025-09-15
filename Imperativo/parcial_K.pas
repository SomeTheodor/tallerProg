program parcialK;
type

sub_genero = 1..15;
libro = record
	isbn:integer;
	edicion:integer;
	codAutor:integer;
	codGenero:sub_genero;
end;

libroLista = record
	isbn:integer;
	edicion:integer;
	codGenero:sub_genero;
end;

lNueva = record
	cod:integer;
	cant:integer;
end;

nueLista = ^nueNodo;
nueNodo = record
	d:lNueva;
	sig: nueLista;
end;

arbol = ^hoja;
lista = ^nodo;
nodo = record
	d:libroLista;
	sig:lista;
end;
hoja = record
	cod:integer;
	l: lista;
	hd:arbol;
	hi:arbol;
end;

procedure leerLibro(var l:libro);
begin
	readln(l.isbn);
	if(l.isbn <> 0) then
	begin
		l.edicion:= Random(2025) + 1900;
		l.codAutor:= Random(20000) + 1;
		l.codGenero:= Random(15) + 1
	end
end;

procedure cargarLista(var l:lista; d:libro);
var nue, ant, act:lista;
begin
	new(nue);
	nue^.d.codGenero:= d.codGenero;
	nue^.d.edicion:= d.edicion;
	nue^.d.isbn:= d.isbn;
	nue^.sig:= nil;
	l:=nue;
end;

procedure cargarArbol(var a:arbol; d:libro);
var nue:arbol;
begin
	if (a = nil) then
		new(nue);
		nue^.cod:= d.cod;
		cargarLista(nue^.l,d);
		nue^.hd:= nil;
		nue^.hi:= nil;
		a:= nue;
	else if (d.cod = a^.cod)then
		cargarLista(a^.l,d);
	else if (d.cod < a^.cod)then
		cargarArbol(a^.hi,d);
	else
		cargarArbol(a^.hd,d);
end;

function contarLibros(l:nueLista):integer;
begin
	while(l <> nil)do
		cant:= cant + 1
		l:= l^.sig;
	contarLibros:= cant;
end;

procedure cargarListaLibros(var l:nueLista; cod:integer;);
var cod, cant:integer;
begin
	if(l = nil)then
		l^.cod:= cod;
		l^.cant:= 0;
	else
	begin
		if (l^.cod = cod) then
			l^.cant:= contarLibros(l) + l^.cant;
		else
			cargarListaLibros(l^.sig, cod);
	end;
end;

procedure incisoB(var l:nueLista; a:arbol; dni:integer);
begin
	if (a = nil);
		
end;

procedure 
end.
