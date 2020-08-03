# Red Neuronal de Adeline en matlab

## Contenido
1. Funcionamiento y archivos
2. Sobre la RNA de Adeline
3. Pseudocódigo

## Funcionamiento y archivos
Para utilizar la RNA simplemente abre Adaline.m con matlab. Para mas detalles puedes checar el pseudocodigo.

## Sobre la RNA de Adaline
La RNA de Adaline fue desarrollada por Bernie Widrow en la Universidad de Stanford poco después de que Ronsenblatt desarrollara el Perceptron. Las arquitecturas de ambas redes son las mismas que la de su antecesor: utilización de neuronas con funciones de transferencia escalón.

La red Adaline utiliza una única neurona de salida, mientras que Madaline puede tener varias. La diferencia fundamental con respecto al perceptrón se refiere al mecanismo de aprendizaje.

Estas redes utilizan la denominada regla Delta de Hidrow-Hoff o regla del mínimo error cuadrado medio, basada en la búsqueda del mínimo de una expresión del error entre la salida deseada y la salida lineal obtenida antes de aplicarle la función de activación escalón (frente a la salida binaria utilizada en el Perceptron). Por tanto, estas redes pueden procesar información analógica, tanto de entrada como de salida, utilizando una función de activación lineal o sigmoidal. Sus principales aplicaciones están en el campo del procesamiento de señales, en concreto, para el diseño y realización de filtros que elimine el ruido en señales portadoras de información. Destaca su uso como filtros de ecualización adaptativos en modems de alta velocidad y canceladores adaptativos del eco para el filtrado de señales en comunicaciones telefónicas de larga distancia y comunicaciones vía satélite.

## Pseudocódigo

1. Obtención de datos.
   - Obtención del conjunto de entrenamiento a través de un archivo *.txt.
   - Preguntar por los datos: eitI, itmax, alfa, nombre del archivo de salida.
   - Inicialización y declaración de variables a usar: #datos, #targets, iteraciones, rondas, valor de eit por iteración, fin = 0 (variable que determina el criterio de finalizacion), asignación de forma aleatoria (0-1) de los pesos sinápticos, archivos de apoyo para graficar.
2. Proceso de aprendizaje.
   - Se inicia un ciclo cuyas iteraciones serán iguales a itmax.
     - El valor de eit por iteración será cero.
     - Se inicia un ciclo para recorrer cada uno de los datos del conjunto de entrada.
       - Se calcula el valor de a = p*w+b, según el dato del conjunto de entrada en el que el ciclo se encuentre.
       - Se calcula el valor de e = (t-a)2, según el dato del conjunto de entrada en el que el ciclo se encuentre.
       - Se agrega el valor de e a la variable de eit.
       - Se calculan y se suman los incrementos de wi correspondientes.
       - Se almacenan los datos obtenidos en los archivos de salida, y en los archivos de apoyo para graficar.
     - Fin del ciclo.
     - Se calcula el valor de eit de la iteración, eit=eit/#datos. Se almacena esta variable en un archivo de apoyo para graficar.
     - Se almacenan los valores finales de la iteración en el archivo de salida.
     - El número de iteraciones se incrementa en 1 y rondas=iteraciones.
     - Se verifica si es que el valor de eit es aceptable para terminar el aprendizaje.
       - De ser aceptable (eit<=eitI), iteraciones=itmax. El aprendizaje termina y fin=1.
   - Fin del ciclo.
   - Se guardan los archivos de apoyo.
   - Se incluye en el archivo de salida si el aprendizaje fue (o no) exitoso. Según el valor de fin.
     - Si fin=0, se terminó el aprendizaje por iteraciones. El aprendizaje no fue exitoso.
     - Si fin=1, se terminó el aprendizaje por que el error era aceptable, el aprendizaje fue exitoso.
   - Se guarda el archivo de salida.
3. Graficar.
   - Se cargan los archivos de apoyo para graficar.
   - Se obtienen las variables: pesos (todos los pesos sinápticos calculados), errores (todos los errores calculados) y eitval (los valores de eit por iteracion).
   - Se genera el vector aux, para graficar eit.
   - Se grafican los pesos.
   - Se grafican los errores y eitval, aux.
4. Fin.
