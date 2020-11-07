# Jaloguin

Dulce o truco! Para jalogüin una empresa nos pidió un sistema que lleve el control de los sustos en una ciudad. El software, claro está, tenía que estar para el viernes pasado. 

### Sustos

Para obtener caramelos, los niños intentarán asustar a los adultos.

La capacidad de asustar de un niño se calcula como la sumatoria del susto que generan los elementos que tenga puestos (trajes y maquillajes, por ahora) multiplicado por la actitud del niño (un índice de 1 a 10):

- Todos los maquillajes asustan lo mismo (actualmente 3, pero puede cambiar en un futuro).
- El traje asusta según sea el personaje que represente: 
	- Tiernos: trajes como Winnie Pooh o Sullivan asustan 2
	- Terroríficos: trajes como Jason o George Bush asustan 5


Cuando un niño intenta asustar a un adulto, si lo logra, recibe de éste una cierta cantidad de caramelos, que guarda en su bolsa. No todos los adultos son igualmente propensos a asustarse:
- Los adultos comunes sólo se asustan si tienen una tolerancia menor que la capacidad de susto del niño, y dan tantos caramelos como la mitad de su tolerancia.
La tolerancia se calcula como 10 * la cantidad de niños con más de 15 caramelos que intentaron asustarlo antes.
- Los abuelos simulan asustarse siempre, y entregan la mitad de los caramelos de un adulto común
- Los adultos necios nunca se asustan.

1. Obtener la capacidad de asustar de un niño.
2. Hacer que un niño intente asuste a alguien, obteniendo los caramelos, si lo logra

### Legión

Los niños son más efectivos si asustan en grupos, que son llamados “legiones de terror”. De estas sabemos que:

- La capacidad de asustar de una legión es equivalente a la sumatoria las capacidades de sus miembros
- La cantidad de caramelos en posesión de la legión es equivalente a la sumatoria de caramelos en posesión de sus miembros
- Al igual que los niños, cuando intentan asustar, reciben caramelos. Sin embargo, los caramelos van a las arcas del líder de la legión. 
El líder es el miembro con mayor capacidad de asustar. 

1. Dado un conjunto de niños, crear una legión. Toda legión debe tener al menos dos niños, por lo que la creación debe fallar si no se cumple esta restricción
1. Hacer que una legión intente asustar a una persona, obteniendo los caramelos, si aplica. 
1. Nos informan que los niños han aprendido a formar legiones de legiones, es decir, legiones donde sus miembros pueden ser niños u otras legiones. Si es necesario hacer algún cambio para soportar este requerimiento, realizarlo. De lo contrario, explicar porqué es posible

### Estadisticas barriales

En cada barrio habitan muchos niños. Se desea poder obtener estadísticas para cada barrio:
1. Los tres niños que más caramelos tienen.
1. Los elementos, sin repetidos, usados por los niños con más de 10 caramelos

### Alimentación

Los niños a veces se comen cierta cantidad de sus caramelos. 
Cuando esto ocurre, disminuye la cantidad de caramelos en su bolsa. 

1. Hacer que un niño se coma una cantidad dada de caramelos. Si no tiene suficientes caramelos, debe fallar.


### Indigestión (bonus)

Requerimiento de último momento: Comer muchos caramelos hace mal!! Cuando un niño come caramelos, su estado de salud se ve repercutido.

- Inicialmente los niños están sanos. En este estado, se comportan como hasta ahora. Y si comen más de 10 caramelos juntos, pasan a estar empachados.
- Cuando están empachados, su actitud se disminuye a la mitad. Y si comen 10 caramelos juntos, pasan a estar en cama.
- Cuando están en cama, ya no pueden asustar a nadie (su actitud es cero, y ya no pueden comer más caramelos).

1. Realizar los cambios necesarios. 


## Se pide:

- Plantear un workspace para cada punto
- El código. No es necesario codificar todos los accessors. 
- Un diagrama de clases
- Diagrama de objetos si fuera necesario

