Identificación de requisitos no funcionales
===========================================

Los siguientes requisitos no funcionales son especificados:

NFR-1: Comunicación
-------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1
- **Requisitos asociados**: RF-1, RF-2
- **Descripción**: El número de mensajes transmitidos por el protocolo debe reducirse a la cantidad más pequeña posible, a fin de minimizar el impacto general en la red y en los nodos receptores. Por ello, las comunicaciones se realizarán a través de mensajes **multicast**, que únicamente son procesados por los nodos suscritos al grupo en el que son transmitidos. De esta forma los nodos no interesados evitan dedicar tiempo de CPU al análisis de estos datagramas.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
  

NFR-2: Minimalismo
------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: Toda aquella funcionalidad que no esté relacionada con el descubrimiento y publicación de servicios y nodos se delegará a paquetes software que se apoyen sobre MarcoPolo, delegando la responsabilidad a dichos paquetes. MarcoPolo debe conseguir un alto grado de versatilidad y aplicabilidad en un gran rango de aplicaciones. A fin de conseguir este objetivo, la simplicidad del sistema construido es clave. Esto conlleva el desacoplamiento y delegación de gran parte de la funcionalidad a otras capas superiores, independientes del protocolo, pero que aprovechan su funcionalidad, en lugar de ser integradas en el mismo.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-3: Portabilidad
-------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Requisitos asociados**: RF-6
- **Descripción**: MarcoPolo debe ser un protocolo capaz de funcionar en cualquier configuración de **hardware** y **software** que soporte los requisitos de red exigidos por el mismo. Este requisito no afecta a cualquiera de las implementaciones del mismo, que podrán ser diseñadas para aprovechar las características específicas de una arquitectura *hardware* o *software* concreta.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-4: Integrabilidad
---------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Requisitos asociados**: RF-6, RF-7, RF-8, RF-9, RF-10, RF-11
- **Descripción**: La funcionalidad de MarcoPolo debe ser aprovechable por usuarios de forma directa (mediante la interacción con el propio paquete) o indireta, a través de mecanismos de conexión con otras aplicaciones.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-5: Independencia del lenguaje
---------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: El protocolo debe ser independiente del lenguaje de programación en el que sea implementado. Dicha implementación debe proporcionar puntos de acceso consumibles por cualquier paquete **software**.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-6: Separación del protocolo y la implementación
---------------------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**:Análisis preliminar
- **Requisitos relacionados**: RF-13
- **Descripción**: MarcoPolo es un protocolo. La implementación de referencia del mismo proporciona una referencia para su aplicación, pero no es el único enfoque válido para realizar dicha implementación.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-7: Gestión de errores
-------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Requisitos asociados**: RF-4
- **Descripción**: La gestión y recuperación de errores debe ser transparente para el usuario. En caso de que dicha transparencia no pueda ser satisfecha, el protocolo y la implementación deben proveer mensajes claros que describan el error, y qué agente ha causado el mismo (el usuario debido a un error de uso, un error interno, etcétera).
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-8: Separación de roles
--------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-5, RF-7, RF-8, RF-9, RF-10, RF-11
- **Descripción**: En el protocolo existen dos roles claramente definidos: el descubrimiento de nodos y servicios (Marco) y la publicación de estos (Polo) en la red. Se deberá mantener la independencia entre dichos roles, de forma que puedan funcionar de forma independiente.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-9: Estándares de comunicación y representación de información
-----------------------------------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Requisitos asociados**: RF-13
- **Descripción**: Todos los mensajes transmitidos en el sistema deberán ser codificados en UTF-8 y serán serializados utilizando el formato *JavaScript Object Notation* (JSON), con el objetivo de mantener la legibilidad de los mensajes tanto por humanos y máquinas.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-10: Configurabilidad
------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: Se deberá facilitar la configurabilidad de MarcoPolo a través de archivos de configuración o cualquier sistema similar. Estos archivos seguirán el formato definido en la RFC 822 [1]_
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-11: Sincronización
----------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1, OBJ-2, OBJ-3
- **Requisitos asociados**: RF-1, RF-2, RF-3, RF-5, RF-6, RF-7, RF-8, RF-9, RF-10, RF-11
- **Descripción**: Los diferentes mensajes transmitidos deberán ser definidos con la secuencia en la que son transmitidos, a qué mensaje responden y qué mensaje debe suceder, etcétera.
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-12: Documentación
---------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: Los siguientes casos deberán ser documentados:

    + Documentación del mecanismo de comunicación
    + Referencia de la API, que incluirá todos los aspectos internos de MarcoPolo y de los diferentes mecanismos de conexión.
- **Importancia**: Alta
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-13: Homogeneidad
--------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-6, RF-7, RF-8
- **Descripción**: Los diferentes lenguajes de programación para los que se desarrollen mecanismos de conexión con MarcoPolo deberán ser creados siguiendo una semántica homogénea (nombres de métodos y parámetros, orden, tipos de retorno, gestión de errores), sin que ello impida el uso de características propias de cada lenguaje que se consideren beneficiosas.
- **Importancia**: Alta
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-14: Calidad del software
----------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: Se deberán utilizar mecanismos de verificación del funcionamiento del software como la aplicación de test unitarios para situaciones en las que el sistema se comporta de forma correcta como para situaciones anómalas.
- **Importancia**: Alta
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-15: Comunicación no fiable
------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-1
- **Descripción**: Todos los mensajes se transmiten en datagramas UDP con el objetivo de minimizar el impacto en la red.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**:
    
    + Por naturaleza, los mensajes *multicast* se deben enviar en UDP obligatoriamente.
    + En los casos en los que este tipo de comunicación no posibilite alguna acción, se utilizará un protocolo orientado a conexión, como TCP. Un ejemplo son las conexiones cifradas.

NFR-16: Gestión de usuarios
---------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: RF-6
- **Descripción**: Los usuarios se comunicarán con MarcoPolo a través de comunicaciones seguras (utilizando el protocolo TLS/SSL y tokens de usuario) con el objetivo de evitar suplantaciones de identidad.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-17: Sencillez de la API
---------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: La API de MarcoPolo debe ser sencilla de comprender y utilizar, utilizando diferentes herramientas de evaluación para analizar estas propiedades.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-18: Documentación del código
--------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Descripción**: El código deberá utilizar cadenas de documentación (*docstrings*) que describan cada uno de los métodos, funciones y módulos creados. Estas cadenas podrán ser aprovechadas por entornos de desarrollo o por herramientas de documentación para generar la referencia de todas las *APIs* creadas. Se utilizarán para esta última tarea las herramientas `Sphinx (sphinx-doc.org) <http://sphinx-doc.org/>`_ y `Doxygen (doxygen.org) <http://doxygen.org>`_.
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-19 Segmentación
-------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: RF-1, RF-2
- **Descripción**: Varias instancias del protocolo pueden ejecutarse en una misma red de forma independiente, permitiendo la creación de varias "mallas" de equipos. Dicha segmentación no debe alterar en absoluto el esquema de la red preexistente.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

NFR-20 Seguridad
----------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Fases de desarrollo
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: RF-2
- **Descripción**: En aquellos casos en los que la información enviada a través de los \textit{bindings} o compartida por los nodos sea confidencial, el protocolo debe implementar las medidas oportunas para la protección de la misma. En particular, se deberá utilizar el protocolo TLS para este tipo de comunicaciones, junto con un mecanismo de *tokens* de acceso, como se describe en el requisito no funcional NFR-16.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable


NFR-21 Independencia del espacio de direcciones, nombres o cualquier otro elemento de red
-----------------------------------------------------------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Análisis preliminar
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-1, RF-2
- **Descripción**: El protocolo debe funcionar en cualquier espacio de direcciones dado, sin considerar en cualquier caso la dependencia con protocolos como DHCP o DNS .
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

.. [1] STANDARD FOR THE FORMAT OF ARPA INTERNET TEXT MESSAGES http://tools.ietf.org/html/rfc822.html

.. 
    - **Versión**
    - **Autores**: Diego Martín
    - **Fuentes**
    - **Objetivos asociados**
    - **Requisitos asociados**
    - **Descripción**
    - **Importancia**
    - **Urgencia**
    - **Estado**
    - **Estabilidad**
    - **Comentarios**