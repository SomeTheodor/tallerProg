program parcialM;

type 
	atencion = record
		dni,dia,matricula:integer;
		diag:string;
end;
rango = 1..6;
lista = ^nodo;
nodo = record
	sig:lista;
	dni:integer;
end;

vec = record
	l:lista;
	diag:string;
end;
arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	matri:integer;
	cant:integer;
end;
vector = array [rango] of vec;

var diag: array [rango] of string = ('A','B','C','D','E','F');

procedure leerAtencion(var d:atencion);
begin
	d.dni:= Random(100);
	if d.dni <> 0 then
	begin
		d.dia:= Random(30)+1;
		d.diag:= diag[Random(6)+1];
		d.matricula:= Random(200);
	end;
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 6 do
	begin
		v[i].diag:= '';
		v[i].l:= nil;
	end;
end;

procedure cargarLista(var l:lista; dni:integer);
var nue:lista;
begin
	 new(nue);
	 nue^.sig:= l;
	 nue^.dni:= dni;
	 l:= nue;
end;

procedure cargarVector(var v:vector;d:atencion);
var ok:boolean; i:integer;
begin
	i:= 1;
	ok:= false;
	while (ok = false) do
	begin
		if v[i].diag = '' then
		begin
			v[i].diag:= d.diag;
			cargarLista(v[i].l,d.dni);
			ok:= true;
		end
		else if v[i].diag = d.diag then
		begin
			cargarLista(v[i].l,d.dni);
			ok:= true;
		end
		else
			i:= i + 1;
	end;
end;

procedure cargarArbol(var a:arbol; d:atencion);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.matri:= d.matricula;
		nue^.cant:= 1;
		a:= nue;
	end
	else if a^.matri = d.matricula then
		a^.cant:= a^.cant + 1
	else if d.matricula < a^.matri then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure cargarEstructuras(var a:arbol; var v:vector);
var d:atencion;
begin
	leerAtencion(d);
	while d.dni <> 0 do
	begin
		cargarArbol(a,d);
		cargarVector(v,d);
		leerAtencion(d);
	end;
end;

function mayorCantAtencion(a:arbol; m:integer):integer;
begin
	if a = nil then
		mayorCantAtencion:= 0
	else 
	begin
		if a^.matri > m then
			mayorCantAtencion:= mayorCantAtencion(a^.hi,m) + a^.cant + mayorCantAtencion(a^.hd,m)
		else
			mayorCantAtencion:= mayorCantAtencion(a^.hd,m);
	end;
end;

function cantDni(l:lista):integer;
begin
	if l = nil then
		cantDni:= 0
	else 
		cantDni:= cantDni(l^.sig) + 1;
end;

function maxDiag(v:vector; var max:integer;i:integer):string;
var maxAct:integer; maxChar:string;
begin
	if i > 6 then
		maxDiag:= ''
	else
	begin
		maxChar:= maxDiag(v,max,i+1);
		maxAct:= cantDni(v[i].l);
		if maxAct > max then
		begin
			max:= maxAct;
			maxDiag:= v[i].diag;
		end
		else 
			maxDiag:= maxChar;
	end;	
end;
var max,m:integer;
v:vector;
a:arbol;
begin
	Randomize;
	a:= nil;
	inicializarVector(v);
	cargarEstructuras(a,v);
	m:= Random(5);
	max:= -1;

	writeln('Cant de atenciones mayores a ',m, ': ',mayorCantAtencion(a,m));
	writeln('Diagnostico: ',maxDiag(v,max,1));
end.
