program parcialI;

type 
	alquiler = record
		dia: integer;
		chasi:integer;
		dni:integer;
	end;
arbol = ^hoja;
hoja = record
	hd:arbol;
	hi:arbol;
	dni:integer;
	chasi:integer;
end;
vector = array [1..7] of arbol;

procedure leerAlquiler(var d:alquiler);
begin
	d.chasi:= Random(2000);
	if d.chasi <> 0 then
	begin
		d.dni:= Random(100)+1;
		d.dia:= Random(7)+1;
	end;
end; 

procedure cargarArbol(var a:arbol; d:alquiler);
var nue:arbol;
begin
	if a = nil then
	begin
		new(nue);
		nue^.hd:= nil;
		nue^.hi:= nil;
		nue^.chasi:= d.chasi;
		nue^.dni:= d.dni;
		a:= nue;
	end
	else if d.chasi < a^.chasi then
		cargarArbol(a^.hi,d)
	else
		cargarArbol(a^.hd,d);
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 7 do 
		v[i]:= nil;
end;

procedure cargarVector(var v:vector);
var d:alquiler;
begin
	leerAlquiler(d);
	while d.chasi <> 0 do
	begin
		cargarArbol(v[d.dia],d);
		leerAlquiler(d);
	end;
end;

function cantDni(a:arbol; dni:integer):integer;
begin
	if a = nil then 
		cantDni:= 0
	else if a^.dni = dni then
		cantDni:= cantDni(a^.hd,dni) + 1 + cantDni(a^.hi,dni)
	else
		cantDni:= cantDni(a^.hd,dni) + cantDni(a^.hi,dni);
end;

function cantTotalDni(v:vector; dni:integer):integer;
var cant,i:integer;
begin
	cant:=0;
	for i:= 1 to 7 do
	begin
		cant:= cant + cantDni(v[i],dni);
	end;
	cantTotalDni:= cant;
end;

function cantChasiEntre(a:arbol;n1,n2:integer):integer;
begin
	if a = nil then
		cantChasiEntre:= 0
	else 
	begin
		if ((a^.chasi >= n1) and (a^.chasi <= n2)) then
			cantChasiEntre:= cantChasiEntre(a^.hi,n1,n2) + 1 + cantChasiEntre(a^.hd,n1,n2)
		else 
		begin
			if a^.chasi < n1 then
				cantChasiEntre:= cantChasiEntre(a^.hd,n1,n2)
			else 
			begin
				if a^.chasi > n2 then
					cantChasiEntre:= cantChasiEntre(a^.hi,n1,n2);
			end;
		end;
	end;
end;	
var v:vector;
cantChasis,cantDnis,d,n1,n2,dni:integer;
begin
	Randomize;
	d:= Random(7)+1;
	n1:= Random(1000);
	n2:= Random(1000) + 1001;
	inicializarVector(v);
	cargarVector(v);
	dni:= Random(100)+1;
	cantDnis:= cantTotalDni(v,dni);
	writeln('DNI: ', dni, 'Cant: ', cantDnis);
	cantChasis:= cantChasiEntre(v[d],n1,n2);
	writeln('Chasi 1: ', n1, 'chasi 2: ', n2, 'Dia: ', d, 'Cant: ', cantChasis);
end.
