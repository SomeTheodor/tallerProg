program ej3;
type
compra = record
	codGame:integer;
	codCliente:integer;
	mes:integer;
end;

lista = ^nodo;
nodo = record
	mes:integer;
	codCliente:integer;
	sig:lista;
end;
arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	codGame:integer;
	l:lista;
end;

procedure leerCompra(var c:compra);
begin
	c.codCliente:= Random(2000);
	if c.codCliente <> 0 then
	begin
		c.mes:= Random(12) + 1;
		c.codGame:= Random(200) + 100;
	end;
end;

procedure cargarLista(var l:lista; d:compra);
var nue:lista;
begin
	new(nue);
	nue^.codCliente:= d.codCliente;
	nue^.mes:= d.mes;
	nue^.sig:=l;
	l:= nue;
end;

procedure cargarArbol(var a:arbol; d:compra);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.l:=nil;
		nue^.codGame:= d.codGame;
		cargarLista(nue^.l,d);
		a:=nue;
	end
	else if d.codGame = a^.codGame then
		cargarLista(a^.l,d)
	else if d.codGame > a^.codGame then
		cargarArbol(a^.hd,d)
	else
		cargarArbol(a^.hi,d);
end;

function retornarLista(a:arbol; cod:integer):lista;
begin
	if a = nil then
		retornarLista:= nil
	else if a^.codGame = cod then
		retornarLista:= a^.l
	else if cod > a^.codGame then
		retornarLista(a^.hd,cod)
	else
		retornarLista(a^.hi,cod);
end;

function cantClientesMes(l:lista; mes:integer):integer;
begin
	if l = nil then
		cantClientesMes:= 0
	else 
	begin
		if l^.mes = mes then
			cantClientesMes:= cantClientesMes(l^.sig, mes) + 1
		else
			cantClientesMes:= cantClientesMes(l^.sig, mes);
	end;
end;

procedure generarArbol(var a:arbol);
var d:compra;
begin	
	leerCompra(d);
	while d.codCliente <> 0 do begin
		cargarArbol(a,d);
		leerCompra(d);
	end;
end;
var a:arbol; l:lista;cantCliente:integer;
begin
	a:=nil;
	Randomize;
	generarArbol(a);
	if a <> nil then begin
    writeln('Codigo en la raiz: ', a^.codGame);
    l := retornarLista(a, a^.codGame);  // siempre existe
    cantCliente := cantClientesMes(l, Random(12) + 1);
    writeln('Cant en mes: ', cantCliente);
end;


end.
