program parcialK;

type subGenero =  1..15;

libro = record
	isbn,cod,gen:integer;
end;

lista = ^nodo;
nodo = record
	isbn:integer;
	gen:integer;
	sig:lista;
end;

arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	cod:integer;
	l:lista;
end;

lista2 = ^nodo2;
nodo2 = record
	cod:integer;
	cant:integer;
	sig:lista2;
end;

procedure leerLibro(var l:libro);
begin
	l.isbn:= random(200);
	if l.isbn <> 0 then
	begin
		l.cod:= Random(200)+1;
		l.gen:= Random(200)+1;
	end;
end;	

procedure cargarLista(var l:lista; d:libro);
var nue:lista;
begin
	new(nue);
	nue^.gen:= d.gen;
	nue^.isbn:= d.isbn;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarArbol(var a:arbol; d:libro);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.cod:= d.cod;
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.l:= nil;
		cargarLista(nue^.l,d);
	end
	else if a^.cod = d.cod then
		cargarLista(a^.l,d)
	else if d.cod < a^.cod then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure cargarEstructura(var a:arbol);
var d:libro;
begin
	leerLibro(d);
	while d.isbn <> 0 do
	begin
		cargarArbol(a,d);
		leerLibro(d);
	end;
end;

procedure cargarLista2(var l:lista2; cod:integer; l2:lista);
var nue:lista2;
begin
	if l2 <> nil then
	begin
		new(nue);
		while l2 <> nil do
		begin
			nue^.cant:= nue^.cant + 1;
			l2:=l2^.sig;
		end;
		nue^.cod:= cod;
		nue^.sig:= l;
		l:= nue;
	end;
end;

procedure retornarLista(a:arbol; cod:integer; var l:lista2);
begin
	if a <> nil then
	begin
		if a^.cod > cod then
		begin
			cargarLista2(l, cod, a^.l);
			retornarLista(a^.hd,cod,l);
			retornarLista(a^.hi,cod,l);
		end
		else
			retornarLista(a^.hd,cod,l);
	end;
end;

procedure retornarMayorCodCant(var cod,cant:integer;l:lista2);
begin
	if l <> nil then
	begin
		if l^.cant > cant then
		begin
			cod:= l^.cod;
			cant:= l^.cant;
		end;
		retornarMayorCodCant(cod,cant,l^.sig);
	end;
end;


var cant,cod,cod2:integer;
l:lista2;
a:arbol;
begin
	a:=nil;
	l:=nil;
	cod:= Random(200)+1;
	cod2:= -1;
	cant:=-1;
	cargarEstructura(a);
	retornarLista(a,cod,l);
	retornarMayorCodCant(cod2,cant,l);
end.

