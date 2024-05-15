module myF( //describir un componenete
    output wire F, //salida tipo alambre
    input wire A,B,C); //entradas tipo alambre

assign F=(!C&&(!A||B))? 1'b1:1'b0;// amarrar esa parte combinacional
//una assignacion continua LUT tabla de memoria (3-1) entradas-salidas.
//8 memorias de 1 bit(domicilios) LUT(Cadena de memoeria de 1bit) 
//Entradas son el domicilio a la memoria
//El acceso a cualquiera memoria es el mismo tiempo.
endmodule