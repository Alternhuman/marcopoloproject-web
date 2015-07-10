Diseño procedimental
====================

En este apartado se referencian los algoritmos implementados en el sistema que son considerados de mayor relevancia.

Mensaje de descubrimiento 
-------------------------

Algoritmo que realiza el descubrimiento de nodos. Un mecanismo similar se utiliza para el resto de operaciones (marco, request_for...). Se omiten las comprobaciones de datos.

.. literalinclude:: ../../../../marcopolo/marcopolo/marco/marco.py
    :language: python
    :lines: 49,121-162,175

Secuencia de arranque de Polo
-----------------------------

Durante la secuencia de arranque se leen los ficheros de servicios estáticos y se añaden a la lista de servicios a publicar.

.. literalinclude:: ../../../../marcopolo/marcopolo/polo/polo.py
    :language: python
    :lines: 129,137-161

Recepción de un mensaje de descubrimiento
-----------------------------------------

Se incluye a modo de ejemplo las funciones implicadas en el procesamiento de un mensaje ``request-for``. El resto de mensajes se tratan de forma similar.

.. literalinclude:: ../../../../marcopolo/marcopolo/polo/polo.py
    :language: python
    :lines: 203,217-226,257,271-281,283,292-305

Solicitud de un *token* de acceso
---------------------------------

La creación de un token implica el uso del módulo auxiliar ``tokenprovider.py``

.. literalinclude:: ../../../../marcopolo/marcopolo/polo/polobindingssl.py
    :language: python
    :lines: 117-141

.. literalinclude:: ../../../../marcopolo/marcopolo/polo/tokenprovider.py
    :language: python
    :lines: 32-40

Conexión con un binding
-----------------------

Un ejemplo de conexión a uno de los *bindings*, en concreto, para la ejecución de una consulta ``request_for``. Todos los *bindings* siguen la misma estrategia de serialización que este ejemplo representa.

.. literalinclude:: ../../../../marcopolo-bindings/marcopolo-bindings-python/marcopolo/bindings/marco.py
    :language: python
    :lines: 112,138-182