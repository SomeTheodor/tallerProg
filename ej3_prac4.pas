{SIGUE APRENDIENDO - T}


program ej3;

type

  venta = record
    cod:integer;
    codProd:integer;
    cant:integer;
    precio:real;
  end;
  
  dato= record
    cant:integer;
    monto:real;
    codProd:integer;
  end;

  arbol = ^nodoA;
  nodoA = record
    d:dato;
    hd:arbol;
    hi:arbol;
  end;

procedure cargarVenta(var v:venta);
begin
  writeln('Ingrese un codVenta: ');
  readln(v.cod);
  if(v.cod <> -1)then
    begin
      v.codProd:=random(200)+1;
      v.cant:= random(200)+1;
      v.precio:= random(1000)+1;
    end;
end;

procedure cargarArbol(var a:arbol; v:venta);
var nue:arbol;
begin
  if(a = nil)then
  begin
    new(nue);
    nue^.d.codProd:= v.codProd;
    nue^.d.monto:= v.monto * v.precio;
    nue^.d.cant:= 1;
    nue^.hd:= nil;
    nue^.hd:= nil;
    a:=nue;
  end
  else if (a^.d.codProd = v.codProd)then
    begin 
      a^.d.monto:= a^.d.monto + v.monto * v.precio;
      a^.d.cant:= a^.d.cant +1;
    end;
  else if(v.codProd < a^.d.codProd)then
    cargarArbol(a^.hi,v);
  else
    cargarArbol(a^.hd, v);
end;

procedure generarArbol(var a:arbol);
var v:venta;
begin
  cargarVenta(v);
  while (v.cod<> -1)do
  begin
    cargarArbol(a,v);
    cargarVenta(v);
  end;
end;

procedure imprimirArbol(a:arbol);
begin
  if(a<>nil)then
  begin
    imprimirArbol(a^.hi);
    writeln(a^.d.codProd);
    writeln(a^.d.monto);
    writeln(a^.d.cant);
    imprimirArbol(a^.hd);
  end;
end;

procedure mayorCantUnid(a:arbol; var max:integer; var cod);
begin
    if((a^.d.cant > max) AND ((a^.hd <> nil) || (a^.hi <> nil )))then
      begin
        max:= a^.d.cant;
        cod:= a^.d.codProd;
      end
    else
      begin
        mayorCantUnid(a^.hi,max,cod);
        mayorCantUnid(a^.hd,max,cod);
      end;
end;
begin
end.

