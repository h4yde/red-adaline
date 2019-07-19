%%%%%%%%Variables a leer en txt%%%%%%%
%conjunto de entrenamiento
archivo=input('Ingrese el nombre del archivo con el conjunto de entrenamiento: ','s')
conjuntoE=load(archivo)

%Condiciones de finalizacion
eitI=input('Ingrese el valor de eit: ')
itmax=input('Ingrese el numero de itmax: ')

%factor de aprendizaje
alfa=input('Ingrese el valor de alfa: ')

%Variables del proceso de aprendizaje
i=0
[datos,t] = size(conjuntoE)
entradas=t-1
iteraciones=1
eit=0

%pesos sinapticos
w=rand(1,entradas)

%variables del programa
ar_salida=input('Ingrese un nombre para el archivo de salida: ','s')
fin=0 %0:por iteraciones, 1:por valor de error

%variables para archivos
salida=fopen(ar_salida, 'w')
graf=fopen('grafica.txt', 'w')
graf2=fopen('eit.txt', 'w')

fprintf(salida, 'RESULTADOS: \n\n')
fprintf(salida, 'Iteracion 0:\n')
for i=1:entradas
    fprintf(salida, '\tw%d=%.4f', i, w(i))
    fprintf(graf, '%.4f ', w(i))    
end
fprintf(salida, '\n\n')
fprintf(graf, '%.4f\n', 0)

%%%%%%%Proceso de aprendizaje%%%%%%%
while(iteraciones<itmax+1)
    fprintf(salida, '\nIteracion %d:\n', iteraciones)
    eit=0
    for j=1:datos
        %calculo de a
        a=0
        for k=1:entradas
            a=a+(w(k)*conjuntoE(j,k))
        end
        
        %calculo de e, suma de eit
        e=(conjuntoE(j, t)-a).^2
        eit=eit+e
         
        
        fprintf(salida, 'd%d->', j)
        %%calculo del incremento
        for k=1:entradas
            w(k)=w(k)+(2*alfa*conjuntoE(j,k)*(conjuntoE(j, t)-a))
            fprintf(salida, '\tw%d=%.4f', k, w(k))
            fprintf(graf, '%.4f ', w(k))
        end
        fprintf(salida, '\te%d=%.4f\n', j, e)
        fprintf(graf, '%f\n', e)
    end
    
    %calculo de eit
    eit=eit/datos
    fprintf(graf2, '%.4f\n', eit) 
    
    %se guardan los valores de la iteracion: w y eit
    fprintf(salida, '\nValores finales:', iteraciones)
    for i=1:entradas
        fprintf(salida, '\tw%d=%.4f', i, w(i))
    end
    fprintf(salida, '\teit=%.4f\n\n', eit)   
    
    %control de las iteraciones
    iteraciones=iteraciones+1
    rondas=iteraciones
    
    %el algoritmo finaliza, el error es aceptable
    if(eit<=eitI) 
        iteraciones=itmax+1
        fin=1 %se finaliza por valor de error
    end    
end
fclose(graf)
fclose(graf2)



%%%%%%%Formato para el archivo de salida%%%%%%%
if(fin==1)
    fprintf(salida, '\tAPRENDIZAJE EXITOSO!\n\nFinalizacion por valor de error.\nIteraciones=%d', rondas-1)
else
    fprintf(salida, '\tAPRENDIZAJE NO EXITOSO\n\nFinalizacion por iteraciones.\nIteraciones=%d', rondas-1)
end
fclose(salida)



%%%%%%%graficacion%%%%%%%
valores=load('grafica.txt')
eitval=load('eit.txt')
[p1,p2] = size(valores)
pesos=valores(1:p1,1:entradas)
errores=valores(1:p1,entradas+1:entradas+1)
aux=datos:datos:p1

subplot(2,1,1)
for i=1:entradas
    p1 = plot(pesos(:,i),'DisplayName',sprintf('w%d',i),'color',rand(1,3));
    hold on;
    legend ('-DynamicLegend','Location' , 'northeastoutside') 
end
hold off;
title('Pesos sinapticos');
xlabel('i')
ylabel('wi')
grid on

subplot(2,1,2)
plot(errores, 'DisplayName','ei','color',rand(1,3))
hold on;
plot(aux, eitval, 'DisplayName','eit','color',rand(1,3))
hold off;
legend ('-DynamicLegend','Location' , 'northeastoutside') 
title('Valores de ei/eit');
xlabel('i/iteraciones')
grid on
ylabel('ei/eit')