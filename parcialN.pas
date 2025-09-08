program parcialN;

type 
diag = array [1..5] of char;

	atencion = record
		matricula: integer;
		dni:integer;
		mes:integer;
		diagnostico:char;
	end;
arbol = ^nodo;
nodo = record
	dni:integer;
	cod:char;
	hi:arbol;
	hd:arbol;
end;
vector = array [1..12] of arbol;

procedure leerAtencion(var a:atencion);
const v:diag = ('L','M','N','O','P');
begin
	a.matricula:= Random(1000);
	if a.matricula <> 0 then
	begin
		a.dni:= Random(5000) +1000;
		a.mes:= Random(12) +1;
		a.diagnostico:= v[Random(5)+1];
	end;
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to 12 do
	begin
		v[i]:= nil;
	end
end;

procedure cargarArbol(var a:arbol; d:atencion);
var nue:arbol;
begin
	if (a = nil) then
	begin
		new(nue);
		nue^.dni:= d.dni;
		nue^.cod:= d.diagnostico;
		nue^.hd:= nil;
		nue^.hi:= nil;
		a:= nue;
	end
	else 
	begin
	if (a^.dni < d.dni)then
		cargarArbol(a^.hd,d)
	else
		cargarArbol(a^.hi,d);
	end;	
end;

procedure cargarVector(var v:vector);
var d:atencion;
begin
	leerAtencion(d);
	while(d.matricula <> 0)do
	begin
		cargarArbol(v[d.mes],d);
		leerAtencion(d);
	end;
end;

function cantAtencion(a:arbol):integer;
begin
	if(a = nil)then
		cantAtencion:= 0
	else
		cantAtencion:= cantAtencion(a^.hd) + 1 + cantAtencion(a^.hi);
end;

function mayorMesConAtenciones(v:vector; i:integer; var maxCant:integer):integer;
var
  mesRec, cantMes: integer;
begin
  if (i > 12) then
    mayorMesConAtenciones := -1
  else
  begin
    mesRec := mayorMesConAtenciones(v, i+1, maxCant);

    cantMes := cantAtencion(v[i]);
    writeln('Comparando mes ', i, ' con ', cantMes, ' | maxCant actual = ', maxCant);

    if (cantMes > maxCant) then
    begin
      maxCant := cantMes;
      mayorMesConAtenciones := i;
      writeln('  -> Nuevo máximo en mes ', i);
    end
    else
      mayorMesConAtenciones := mesRec;
  end;
end;



function buscarDni(a:arbol; dni:integer):boolean;
begin
	if(a = nil)then
		buscarDni:= false
	else
	begin
		writeln('Estoy en ', a^.dni);
		if (a^.dni = dni) then
			buscarDni:= true
		else
		begin
			if(dni < a^.dni ) then
				buscarDni:= buscarDni(a^.hi,dni)
			else
				buscarDni:= buscarDni(a^.hd, dni);
		end
	end
end;

function fueAtendido(v:vector; dni, i:integer):boolean;
begin
	if (i > 12) then
		fueAtendido:= false
	else
	begin
		writeln('Estoy en el mes: ', i);
		if(buscarDni(v[i],dni)) then
			fueAtendido:= true
		else
			fueAtendido:= fueAtendido(v, dni, i+1);
	end;
end;

procedure imprimirArbol(a:arbol);
begin
  if(a<>nil)then
  begin
    imprimirArbol(a^.hi);
    writeln('DNI: ',a^.dni);
    writeln('Cod: ', a^.cod);
    imprimirArbol(a^.hd);
  end;
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
  for i:= 1 to 12 do
  begin
	writeln('------------Mes-------------: ', i);
	imprimirArbol(v[i]);
  end;
  
end;

var v:vector;
i,maxCant,dni,maxMes:integer;
atendido:boolean;
begin
Randomize;
	i:=1;
	maxCant:= -1;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	maxMes:= mayorMesConAtenciones(v,i,maxCant);
	writeln('Mes con mayor cant de atenciones: ', maxMes);
	writeln('Ingrese un dni: ');
	readln(dni);
	atendido:= fueAtendido(v,dni,i);
	if atendido then
		writeln('El cliente con DNI: ', dni, ' fue encontrado')
	else
		writeln('El cliente con DNI: ', dni, ' no fue encontrado');
end.
