Requisitos de información
=========================

IRQ-1 Servicios publicitados
----------------------------

- **Versión**: 1.5
- **Autores**: Diego Martín
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF-1, RF-2, RF-3, RF-5
- **Descripción**: El sistema creará y gestionará toda la información relativa a los diferentes servicios a publicitar.
- **Datos específicos**: Identificador del servicio, parámetros adicionales, grupos multicast en los que publicitarlo.
- **Tiempo de vida**: El mismo que transcurre entre la publicación y la eliminación del mismo por un usuario o aplicación.
- **Ocurrencias simultáneas**: Una ocurrencia por servicio. No existe un máximo.
- **Importancia**: Muy alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**

IRQ-2 Información de usuarios
-----------------------------

- **Versión**: 1.5
- **Autores**: Diego Martín
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-2
- **Requisitos asociados**: RF-5
- **Descripción**:El sistema deberá consultar la fuente de datos de los usuarios presentes en el sistema con el objetivo de determinar los privilegios de cada uno de ellos.
- **Datos específicos**: Nombre de usuario, UID (o identificador similar en una plataforma que no utilice este valor), grupos de los que es miembro el usuario.
- **Tiempo de vida**: Estos datos son consultados durante todo el tiempo de vida del sistema.
- **Ocurrencias simultáneas**: Tantas como usuarios operen concurrentemente con el sistema.
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**: Estos datos no son modificados por el sistema, únicamente son consultados.

IRQ-3 Registros
---------------

- **Versión**: 1
- **Autores**: Diego Martín
- **Fuentes**: Fases de desarrollo del sistema
- **Objetivos asociados**: OBJ-1, OBJ-2
- **Requisitos asociados**: RF6, RF7
- **Descripción**: Diferentes ficheros de registro se crearán con el objetivo de facilitar la monitorización de las diferentes tareas del sistema, el análisis de comportamientos erráticos en la ejecución, etcétera.
- **Datos específicos**: Se creará un fichero de *log* por cada una de las instancias, pudiendo existir ficheros complementarios (por ejemplo, para la gestión de los *daemons*).
- **Tiempo de vida**: Se añade información a estos ficheros durante todo el tiempo de vida del sistema.
- **Ocurrencias simultáneas**: Un único fichero por cada tipo, pudiendo existir varias entidades accediendo a ellos en casos concretos. 
- **Importancia**: Alta
- **Urgencia**: Alta
- **Estado**: Completo
- **Estabilidad**: Estable
- **Comentarios**: Un caso en el que existen varias entidades de control accediendo a un mismo fichero es el rol Polo, donde se crea una instancia independiente por cada grupo *multicast*, que sin embargo vuelcan la información generada al mismo fichero.

.. 
    - **Versión**
    - **Autores**
    - **Fuentes**
    - **Objetivos asociados**
    - **Requisitos asociados**
    - **Descripción**
    - **Datos específicos**
    - **Tiempo de vida**
    - **Ocurrencias simultáneas**
    - **Importancia**
    - **Urgencia**
    - **Estado**
    - **Estabilidad**
    - **Comentarios**