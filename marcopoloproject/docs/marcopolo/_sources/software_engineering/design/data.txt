Diseño de datos
===============

Objetos de datos
----------------

El sistema utiliza un gran abanico de estructuras de datos, entre las que destacan las siguientes:

- Objetos :class:`Node <marcopolo.marco_conf.utils.Node` para representar la información sobre los diferentes nodos y servicios y retornar esta información.
- Objetos JSON para la comunicación entre los diferentes componentes (mensajes de descubrimiento y respuesta y mensajes entre los *bindings* y las instancias).
 
Estructuras de archivo
----------------------

Se consultan varias fuentes de datos en la aplicación:

- Ficheros de configuración ``/etc/marcopolo/marco/marco.cfg`` y  ``/etc/marcopolo/polo/polo.cfg``, que permiten modificar el comportamiento de la aplicación.
- Ficheros de *log*, que permiten analizar *a posteriori* el comportamiento del programa, en particular ante algún tipo de situación irregular.
- Ficheros de servicio, almacenados en ``/etc/marcopolo/polo/services``, que definen servicios persistentes.
- PAM y fichero ``/etc/passwd`` como fuente de datos para consultar el nombre y directorio *home* correspondiente a un UID (utilizados en Polo).