Requisitos funcionales
======================

RF-1: Descubrimiento de nodos
-----------------------------

- **Versión**: 1.5
- **Autores**: Diego Martín
- **Fuentes**: Fases de análisis
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: NFR-1, NFR-9, NFR-15
- **Descripción**: A petición de un usuario o aplicación, una instancia del *software* realizará una operación de descubrimiento de los diferentes nodos presentes en la red.
- **Precondición**: La instancia de Marco debe haber sido iniciado previamente.
- **Secuencia normal**:

    1. A través de los diferentes mecanismos de interconexión, una aplicación o usuario solicita el descubrimiento de nodos presentes en la red.
    2. El mecanismo de interconexión recibe los diferentes parámetros y los procesa. En caso de que la evaluación no sea satisfactoria, se inicia el caso de uso **RF-4** y posteriormente la ejecución finaliza. En caso contrario, se continúa la secuencia.
    3. El mecanismo de interconexión envía los parámetros a la instancia local de Marco, que realiza la acción solicitada.
    4. Transcurre un pequeño tiempo de espera para las respuestas de los nodos presentes en la red. Este es definido por el usuario, o en caso de que no sea indicado se utiliza un tiempo por defecto. Durante la espera son procesadas las respuestas que se reciben. 
    5. La instancia procesa los datos y los envía a la instancia del conector con la aplicación.
    6. El conector determina si los datos son válidos y los retorna a la aplicación. En caso contrario, comienza el caso de uso **RF-4**.

- **Poscondición**: Se han descubierto los diferentes nodos presentes en el sistema.
- **Excepciones**:

    + **No se puede establecer una conexión con la instancia de Marco**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Muy alta
- **Urgencia**: Muy urgente
- **Estado**: Completo
- **Estabilidad**: Estable

RF-2: Descubrimiento de servicios
---------------------------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-8, NFR-15
- **Descripción**: Los diferentes usuarios del sistema podrán realizar operaciones de descubrimiento de servicios ofrecidos por los diferentes nodos que conforman el sistema.
- **Precondición**: La instancia de Marco debe haber sido iniciado previamente.
- **Secuencia normal**:

    1. A través de los diferentes mecanismos de interconexión, una aplicación o usuario solicita el descubrimiento de todos los servicios que un nodo presente en la red ofrece.
    2. El mecanismo de interconexión recibe los diferentes parámetros y los procesa. En caso de que la evaluación no sea satisfactoria, se inicia el caso de uso **RF-4** y posteriormente la ejecución finaliza. En caso contrario, se continúa la secuencia.
    3. El mecanismo de interconexión envía los parámetros a la instancia local de Marco, que realiza la acción solicitada.
    4. Transcurre un pequeño tiempo de espera para las respuestas de los nodos presentes en la red.
    5. La instancia procesa los datos y los envía a la instancia del conector con la aplicación.
    6. El conector determina si los datos son válidos y los retorna a la aplicación. En caso contrario, comienza el caso de uso **RF-4**.
    7. Se retornan los datos recogidos o una lista vacía en caso de la búsqueda haya sido infructuosa.
    
- **Poscondición**: Se han descubierto todos los nodos presentes en el sistema que ofrecen el servicio solicitado.
- **Excepciones**: 
    
    + **No se puede establecer una conexión con la instancia de Marco**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).

- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Alta
- **Urgencia**: Elevada
- **Estado**: Completo
- **Estabilidad**: Estable

RF-3: Consulta a un nodo
------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-15
- **Descripción**: El software podrá realizar operaciones de consulta a un nodo específico en la red.
- **Precondición**: La instancia de Marco debe haber sido iniciado previamente.
- **Secuencia normal**:
    
    1. A través de los diferentes mecanismos de interconexión, una aplicación o usuario solicita el descubrimiento todos los nodos presentes en la red ofertantes de un servicio identificado por una cadena de texto.
    2. El mecanismo de interconexión recibe los diferentes parámetros y los procesa. En caso de que la evaluación no sea satisfactoria, se inicia el caso de uso **RF-4** y posteriormente la ejecución finaliza. En caso contrario, se continúa la secuencia.
    3. El mecanismo de interconexión envía los parámetros a la instancia local de Marco, que realiza la acción solicitada, enviando una petición al nodo solicitante.
    4. Transcurre un pequeño tiempo de espera para la respuesta del nodo. 
    5. En caso de que el nodo consultado responda, se procesa la lista de servicios incluida en el mensaje.
    6. La instancia procesa los datos y los envía a la instancia del conector con la aplicación.
    7. El conector determina si los datos son válidos y los retorna a la aplicación. En caso contrario, comienza el caso de uso **RF-4**.
- **Poscondición**: Se han descubierto los servicios ofrecidos por un nodo.
- **Excepciones**: 

    + **No se puede establecer una conexión con la instancia de Marco**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **El nodo no se encuentra presente en la red**: El usuario es notificado de esta situación. 
- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Alta
- **Urgencia**: Muy alta
- **Estado**: Completo
- **Estabilidad**: Estable

RF-4: Error
-----------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fase de análisis
- **Requisitos asociados**: NRF-14
- **Descripción**: En caso de que se produzca un error en una tarea, se analiza la situación que ha desencadenado dicho estado y se ofrecen al usuario, en caso de que sea posible, opciones de recuperación.
- **Precondición**: Se debe haber producido un error.
- **Secuencia normal**:

    1. Un error ha sido emitido por alguno de los componentes involucrados en una operación.
    2. El componente que detecta dicho error determina las causas del mismo, identificando diferentes características como el estado del sistema, códigos retornados por funciones, mensajes intercambiados entre componentes, etcétera.
    3. El componente informa al usuario o aplicación, o en su defecto, delega esta tarea a otra entidad en la cadena de comunicación.
    4. El componente determina cuál es el mecanismo de notificación adecuado para la situación dada, y realiza la acción asociada (lanzar una excepción, emitir un código de error, escribir una entrada en un registro...).
- **Poscondición**: El usuario o aplicación es notificado del error.
- **Excepciones**: No se contemplan excepciones
- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Media
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

RF-5 Publicar un servicio
-------------------------
 
- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1
- **Descripción**: Un usuario con los privilegios adecuados podrá publicar un servicio para todo el sistema que será incluido en la lista de servicios a ofrecer.
- **Precondición**: Una instancia de Polo debe estar ejecutándose en el sistema.
- **Secuencia normal**:

    1. El usuario o aplicación solicita la publicación de un servicio a través de los diferentes mecanismos de interconexión presentes, indicando que el servicio debe alcanzar a todo el sistema.
    2. Dicho componente verifica que todos los parámetros son correctos y solicita la inclusión a la instancia de Polo.
    3. Esta instancia valida de nuevo los parámetros y la identidad del usuario que realiza la operación. En caso de que sean correctos (el identificador no está repetido y es válido, los parámetros adicionales son válidos...) se añade a la lista de servicios a ofrecer. Si el usuario no es válido o no cuenta con los suficientes privilegios, un error es lanzado y comienza el caso de uso **RF-4**.
    4. La instancia de Polo retorna el identificador final del servicio.
- **Poscondición**: El servicio es publicado.
- **Excepciones**:

    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
    + **El identificador ya se encuentra en uso**: A través del mecanismo de notificación de errores utilizado en el resto de excepciones se indica esta situación. Sin embargo, el tipo de error deberá ser diferente (no se viola ninguna regla semántica, simplemente se solicita la inclusión de un identificador de servicio ya publicado).
- **Rendimiento**: Alto
- **Frecuencia**: Alto
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**: Este tipo de servicios son conocidos como "raíz" (*root*), y no incluyen en el identificador el nombre del usuario que los ha publicado. Si bien el valor de retorno no es de importancia en este tipo de servicios (pues es idéntico al del identificador solicitado), se incluye para homogeneizar los diferentes puntos de entrada, posibilitando en una misma función la publicación de diferentes tipos de servicios. 

RF-6 Publicar un servicio de usuario
------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Evaluación de usuarios
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: NFR-16
- **Descripción**: Se contempla la posibilidad de que cualquier usuario pueda publicar servicios aprovechando una instancia de Polo local. Sin embargo, estos servicios contarán con una serie de limitaciones respecto a los servicios publicados por usuarios sin privilegios.
- **Precondición**: Una instancia de Polo debe estar ejecutándose en el sistema.
- **Secuencia normal**:

    1. El usuario o aplicación solicita la publicación de un servicio a través de los diferentes mecanismos de interconexión presentes.
    2. Se realizan los pasos 2 y 3 del caso de uso **RF-5**.
    3. La instancia de Polo retorna el identificador final del servicio, que consistirá en una combinación del nombre del usuario (u otra cadena distintiva) con el identificador del servicio. 
- **Poscondición**: El servicio es publicado.
- **Excepciones**:

    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
    + **El identificador ya se encuentra en uso**: A través del mecanismo de notificación de errores utilizado en el resto de excepciones se indica esta situación. Sin embargo, el tipo de error deberá ser diferente (no se viola ninguna regla semántica, simplemente se solicita la inclusión de un identificador de servicio ya publicado).
- **Rendimiento**: Medio
- **Frecuencia**: Media
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

RF-7 Eliminar un servicio
-------------------------
    
- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-1
- **Descripción**: En caso de que una aplicación (generalmente, la ofertante) o un usuario (generalmente el propietario) decidan eliminar un servicio de la lista de ofrecidos, la instancia local de Polo deberá realizar dicha operación. 
- **Precondición**: Una instancia de Polo debe estar ejecutándose en el sistema.
- **Secuencia normal**:

    1. Se solicita a través de uno de los mecanismos de interconexión la eliminación de un servicio, invocando para realizar dicha acción a uno de los elementos de interconexión presentes, adjuntando el identificador para indicar qué servicio eliminar.
    2. Dicho componente verifica que todos los parámetros son correctos y solicita la inclusión a la instancia de Polo.
    3. Esta instancia valida de nuevo los parámetros y la identidad del usuario que realiza la operación. En caso de que sean correctos (el servicio a eliminar está publicado) se elimina de la lista de servicios a ofrecer. Si el usuario no es el "propietario" del servicio o no cuenta con los suficientes privilegios, un error es lanzado y comienza el caso de uso **RF-4**.
    4. El usuario o aplicación es notificado del resultado de la operación.
- **Poscondición**: El servicio es eliminado de la lista de servicios a ofrecer.
- **Excepciones**:

    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
- **Rendimiento**: Alto
- **Frecuencia**: Media
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

RF-8: Eliminar servicio de usuario
----------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fase de análisis
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-1
- **Descripción**: En caso de que una aplicación (generalmente, la ofertante) o un usuario (generalmente el propietario) decidan eliminar un servicio no global de la lista de ofrecidos, la instancia local de Polo deberá realizar dicha operación. 
- **Precondición**: Una instancia de Polo debe estar ejecutándose en el sistema.
- **Secuencia normal**:

    1. Se solicita a través de uno de los mecanismos de interconexión la eliminación de un servicio, invocando para realizar dicha acción a uno de los elementos de interconexión presentes, adjuntando el identificador para indicar qué servicio eliminar e indicando que el servicio no es de carácter global.
    2. Se realiza la secuencia de pasos 2 a 4 del caso de uso **RF-7**.
- **Poscondición**: El servicio es eliminado de la lista de servicios a ofrecer.
- **Excepciones**:
    
    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
- **Rendimiento**: Alto
- **Frecuencia**: Media
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

RF-9 Creación de un servicio estático
-------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fase de análisis y de desarrollo del sistema
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-1
- **Descripción**: Un servicio estático es aquel que es registrado en un fichero de texto, y por tanto es persistente (en caso de que el sistema sea reiniciado no se pierde la información). Todos los usuarios podrán publicar este tipo de servicios, sujetos a las mismas restricciones que el resto de variedades, a partir de ahora denominados servicios "dinámicos".
- **Precondición**
- **Secuencia normal**:

    1. Un usuario o aplicación crea un fichero con la estructura requerida para que la instancia de Polo pueda procesarla (ver NFR ).
    2. En caso de que el servicio sea raíz, se deberá recargar o reiniciar la instancia de Polo (si no se encuentra activa, se deberá iniciar). En caso contrario, el sistema procesará el servicio en el momento en el que se solicite el mismo (de esta forma se evita el sondeo de todos los directorios de usuario).
    3. Si los parámetros son válidos, el servicio es publicado. En caso contrario una entrada en un registro de errores es almacenada.
- **Poscondición**: El servicio es publicado.
- **Excepciones**:

    + Si la sintaxis es inválida, el servicio no es publicado y se almacena un mensaje de error en un registro..
- **Rendimiento**: Alto
- **Frecuencia**: Media
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable

.. TODO: CU8, ver NFR

RF-10 Modificar servicio
------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-1
- **Descripción**: La información adicional que un servicio ofrece puede ser modificada tras ser publicado.
- **Precondición**: El servicio debe estar publicado en el sistema.
- **Secuencia normal**:
    
    1. Se solicita a través de uno de los mecanismos de interconexión la modificación de un servicio, indicando dicha acción a uno de los elementos de interconexión presentes. En la invocación se incluyen los valores a incluir.
    2. Dicho componente verifica que todos los parámetros son correctos y solicita la inclusión a la instancia de Polo.
    3. Esta instancia valida de nuevo los parámetros y la identidad del usuario que realiza la operación. En caso de que sean correctos (el servicio a modificar está publicado) se realiza la acción solicitada. Si el usuario no es el "propietario" del servicio o no cuenta con los suficientes privilegios, un error es lanzado y comienza el caso de uso **RF-4**. En caso de que sea un servicio estático, los nuevos valores se almacenarán en el fichero.
- **Poscondición**: El servicio es modificado.
- **Excepciones**: 
    
    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
- **Rendimiento**: Medio
- **Frecuencia**: Media
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Parcialmente completo
- **Estabilidad**: Estable

RF-11 Modificar servicio de usuario
-----------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: IRQ-1, NFR-1
- **Descripción**: La información adicional que un servicio no global ofrece puede ser modificada tras ser publicado.
- **Secuencia normal**:

    1. Se solicita a través de uno de los mecanismos de interconexión la modificación de un servicio, indicando dicha acción a uno de los elementos de interconexión presentes. En la invocación se incluyen los valores a incluir.
    2. Se ejecutan los pasos 2 y 3 del caso de uso **RF-10**.
- **Poscondición**: El servicio es modificado.
- **Excepciones**:

    + **No se puede establecer una conexión con la instancia de Polo**: En este caso el conector envía un mensaje de error específico para cada plataforma (excepción, código de estado...) indicando esta situación, con el objetivo de que la aplicación pueda recuperarse del error (asumir unos valores por defecto que sustituyan a los datos solicitados, realizar la operación de nuevo...).
    + **Los parámetros son inválidos**: Generalmente el mecanismo de interconexión detectará este tipo de situaciones, retornando un mensaje de error (a través de una excepción, un código de retorno) al usuario. En caso de que el error sea detectado por la instancia de Polo, esta solicitará al conector que informe al usuario, aprovechando el mismo método de notificación.
- **Rendimiento**: Medio
- **Frecuencia**: Media
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Parcialmente completo
- **Estabilidad**: Estable

RF-12: Proceso de datos recibidos
---------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fase de análisis
- **Objetivos asociados**: OBJ-1, OBJ-2, OBJ-3
- **Requisitos asociados**: IRQ-1, IRQ-2
- **Descripción**: Las diferentes secuencias de comunicación requieren un procesado del contenido de los mensajes recibidos. Dado que todos los mensajes siguen una estructura similar, su procesado es idéntico.
- **Precondición**: Un mensaje es recibido como respuesta a un mensaje enviado anteriormente o como inicio de una transmisión.
- **Secuencia normal**: 

    1. Al recibir una cadena de texto, esta es procesada siguiendo las especificaciones del requisito no funcional **NFR 9** (todas las cadenas siguen el formato JSON).
    2. La cadena es convertida en una estructura de datos nativa del lenguaje en el que se implementa la funcionalidad.
    3. Se extraen de dicha estructura los datos de relevancia para el solicitante. En caso de que no existan, se emitirá un error, comenzando el caso de uso **RF-4**.
- **Poscondición**: Los datos han sido extraídos.
- **Excepciones**: 

    + En caso de que el procesamiento de la cadena emita un error (por fallos en la estructura de la misma), comienza el caso de uso **RF-4**.
- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Media
- **Urgencia**: Media
- **Estado**: Completo 
- **Estabilidad**: Estable
  
RF-13: Serialización de la información
--------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fase de análisis
- **Objetivos asociados**: OBJ-1, OBJ-2, OBJ-3
- **Requisitos asociados**: NFR-1, RF-1, RF-2
- **Descripción**: Los diferentes datos a transmitir han de ser estructurados siguiendo las especificaciones del requisito no funcional **NFR9**.
- **Precondición**
- **Secuencia normal**:

    1. Se crea una estructura de datos nativa que recoge toda la información a transmitir.
    2. Una herramienta de conversión recorre todos los campos y traduce los mismos al formato definido en el requisito no funcional **NFR9**.
- **Poscondición**
- **Excepciones**:

    + **Un tipo de dato no es serializable**: La herramienta de conversión emitirá un error que será procesado por el caso de uso **RF-4**.
- **Rendimiento**: Alto
- **Frecuencia**: Alta
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**: Generalmente se delegará la tarea de la conversión a bibliotecas incluidas en el sistema o herramientas de terceros. 

RF-14: Consulta sobre la información sobre un servicio
------------------------------------------------------

- **Versión**: 1
- **Autores**: Diego Martín 
- **Fuentes**: Fases de desarrollo
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-13, NFR-1
- **Descripción**: Es posible realizar consultas a la instancia local de Polo sobre los servicios que ofrece.
- **Precondición**: Una instancia de Polo debe estar ejecutándose en el sistema.
- **Secuencia normal**:

    1. A través de uno de los diferentes mecanismos de interconexión se solicitará la consulta de información.
    2. Este mecanismo validará los valores de los parámetros con los que se le invoca.
    3. Se envía la solicitud a la instancia de Polo.
    4. La instancia retorna los datos solicitados.
- **Poscondición**: El usuario o aplicación obtiene los datos.
- **Excepciones**: 

    + **No se dispone de información sobre el servicio indicado**: Se indica esta condición con un mensaje o código informativo.
- **Rendimiento**: Alta
- **Frecuencia**: Media
- **Importancia**: Baja
- **Urgencia**: Baja
- **Estado**: Por completar
- **Estabilidad**: Baja

.. rubric:: Casos de uso

.. toctree::

    uc

.. 
    - **Versión**: 
    - **Autores**: Diego Martín 
    - **Fuentes**: 
    - **Objetivos asociados**: 
    - **Requisitos asociados**: 
    - **Descripción**
    - **Precondición**
    - **Secuencia normal**
    - **Poscondición**
    - **Excepciones**
    - **Rendimiento**
    - **Frecuencia**
    - **Importancia**
    - **Urgencia**
    - **Estado**
    - **Estabilidad**
    - **Comentarios**

