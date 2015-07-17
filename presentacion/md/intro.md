<img src="img/Logo_USAL_Blanco_2012.svg" width="20%"/>

#### Diseño e implementación de un sistema de computación distribuida con Raspberry Pi, y estudio comparativo del mismo frente a otras soluciones 

<small>Autor: Diego Martín Arroyo</small>
<br>
<small>Tutor: Rodrigo Santamaría Vicente</small>
<br>
<small>Tutor: José Andrés Vicente Lober</small>
<br>
[marcopoloproject.martinarroyo.net](http://marcopoloproject.martinarroyo.net/)


## Índice

- Propuesta y evaluación de alternativas
    - Propuesta de solución
- Sistema Operativo
- Servicios sobre el sistema operativo
    - Propios
    - De terceros
- Aplicaciones de usuario
- Resultado final
    - Estructura física
- Herramientas
- Gestión del proyecto, integración, etc



## Propuesta

- Análisis de sistemas similares
    - Hardware de muy bajo coste
- Experimentar con este tipo de componentes
- Solución a problemas de sobrecarga
- Componente didáctico
    - Estudiar la aplicabilidad en diferentes asignaturas


## Alternativas

- Virtualización, **COTS**, equipos multimedia, computadores de placa única...

<ul class="images">
<li><img width="23%"src="img/virtualization.svg"/></li>
<li><img width="23%"src="img/beowulf.jpg"/></li>
<li><img width="23%"src="img/chromecast.jpg"/></li>
<li><img width="23%"src="img/raspberrypi.jpg"/></li>
</ul>


## State of the art

<img class="soa" src="img/kiepert-main.jpg"/>


<img class="soa" src="img/iridis-pi.jpg"/>


<img class="soa" src="img/bramblegchq.jpg"/>



## Propuesta de solución

- __*Hardware*__: Raspberry Pi 2 
- __Sistema operativo__: Arch Linux ARM
- __Lenguaje de programación principal__: Python
- Interconexión mediante la red existente

Note: Comenzar con herramientas similares, enseguida se identifica la necesidad de un protocolo de descubrimiento. Python. Rendimiento/sencillez + Frameworks


## Requisitos

- Mínimo coste
- Escalabilidad
- Mantenimiento sencillo
- Autoconfigurado
- Aplicable a diferentes asignaturas
- Independencia de la plataforma
- *Transparente*


<!-- .slide: style="background-repeat:no-repeat;" data-background="url('img/raspberrypi.jpg') no-repeat center" -->
## 

<img src="img/capa-0.svg" width="40%" alt="Capa 0"/>


## Hardware

Las placas Raspberry Pi son la mejor alternativa
- Precio
- Soporte
- Potencia de cálculo

El proyecto comienza con 5 nodos



## Sistema operativo

<img src="img/capa-1.svg" width="40%" alt="Capa 1"/>


## Sistema operativo

__Arch Linux ARM__ es elegido como la mejor opción frente a alternativas como __Raspbian__ por su rendimiento y versatilidad.

Supera al resto de alternativas en consumo de recursos, modularidad, disponibilidad de paquetes y adaptabilidad.



## Servicios del sistema operativo

<img src="img/capa-2.svg" width="60%" alt="Capa 2"/>

Note: Los servicios que provee el sistema operativo son el fundamento sobre el que se apoyan el resto de componentes *software*, y por tanto cubrirán las necesidades básicas de todos los componentes.


## Autoconfiguración

- Problema detectado rápidamente
- Es necesario un mecanismo que identifique todos los nodos presentes en una red sin configuración previa
- Independiente de la red
- Compatible con los objetivos de transparencia
- Alternativas como *Bonjour* o *Avahi* no son viables


## MarcoPolo

- Protocolo propio de descubrimiento
- Orientado a servicios
- Implementado sobre Twisted


## Características

- Dos roles independientes (Marco, Polo)
- Un nodo puede operar de forma independiente en múltiples mallas
- Independiente de plataforma
    - Mensajes JSON enviados por *Multicast*
- Mensajes UDP (protocolo no fiable)
- Conectable: *bindings* en 4 lenguajes, extensible a más
- Conjunto de utilidades de consola

Note:JSON, Twisted, Demo


## Funcionamiento

Note: Funcionamiento de MarcoPolo


## Gestión de usuarios

- Servidor LDAP del centro para realizar la gestión de usuarios (simplifica el uso del sistema)
- Es necesario garantizar la transparencia de acceso.
- Solución: módulo propio para __PAM__ (implementado en C/C++ e integrado con *MarcoPolo* a través del *binding*)


## Funcionamiento

Note: Funcionamiento


## Arranque en red

- Uno de los objetivos del proyecto es simplificar la administración del mismo
- Operaciones como la instalación del sistema operativo o tareas rutinarias pueden ser tediosas para el administrador
- Las placas Raspberry Pi no son compatibles con __PXE__


## Marcobootstrap

- Herramienta de gestión de la instalación y actualización del sistema operativo, reinicio del sistema, apagado...
- Instalación desatendida y autoconfigurada (mediante MarcoPolo) del sistema operativo en red


### MarcoBootstrap-Backend
<img src="img/marcobootstrap.png" alt="Vista de la interfaz de la herramienta marcobootstrap" width="80%"/>
- Ofrece imágenes del sistema operativo y el *bootcode*
- Planificación, gestión y cancelación de operaciones


### MarcoBootstrap-Slave

- Recibe peticiones de *MarcoBootstrap-backend*, programando las operaciones requeridas
- Proceso *daemon* en cada uno de los nodos, detectable a través de __MarcoPolo__


### marco-netinst

- Instalación desatendida del sistema operativo
- Utiliza una versión mínima de *MarcoPolo* para el descubrimiento de un servidor *MarcoBootstrap*
- Reduce el tiempo de atención humana a menos de 2 minutos por cada nodo a instalar
- Instalable manualmente o a través de Marcobootstrap-slave para operaciones de actualización

Note: Demo. Cargar la imagen de S.O. Herramientas de creación. Prueba la versatilidad de Marco-Polo


## Servicios de terceros


## DistCC

Las placas elegidas tienen una potencia de cómputo baja
- Tareas como la compilación de código son lentas
- Soluciones como QEMU no son factibles

- Solución: Compilación distribuida
- Para aprovechar un equipo más potente, pero de arquitectura x86, se crea un compilador cruzado específico
- Transparente: 

> distcc gcc -c main.c -o main.o

Note: Sun server- Eclipse


### Rendimiento

El tiempo de compilación se reduce drásticamente.

- OpenMPI:
    - __Rasbperry Pi__: 1 h y 14 minutos
    - __Distcc__ sin paralelización: 45 minutos
    - __Distcc__ con 4 trabajos paralelos (`make -j4`): 21 minutos


## OpenMPI

- Integración con las diferentes herramientas del sistema.
- Compatible con las prácticas de __Arquitectura de Computadores__
- Pruebas de concepto creadas


## Tomcat

- Integrado con las herramientas creadas
- Una instancia independiente para cada usuario


## quick2wire

Se plantea el uso del puerto GPIO para las diferentes aplicaciones creadas
Problemas:
- El puerto GPIO es manipulable con permisos de superusuario (inviable en un entorno académico)
- Existe una biblioteca capaz, __quick2wire-python-api__, escrita en Python, pero se desea utilizar el puerto en aplicaciones escritas en C/C++
- Solución: portar la API de Python a C++


## Características

- Se ha portado toda la funcionalidad relativa a la manipulación de los pines en modo salida
- Permite la manipulación de cualquier pin, estableciendo relaciones de "posesión" entre un usuario y un pin


## MarcoManager

- Integración de *MarcoPolo* en servicios de terceros
- Permite realizar operaciones típicas de __cron__
- Integrado con __Tomcat__ y __Distcc__



## Aplicaciones de usuario

<img src="img/capa-3.svg" width="40%" alt="Capa 3"/>


## Despliegue

- Realizar operaciones de despliegue en diferentes equipos suele ser un proceso tedioso
- Herramientas como __scp__ o __ftp__ son poco versátiles
- Se suma el problema de la detección de nodos


## Deployer

<img src="img/screenshot-deployer.png" alt="Vista de la herramienta deployer" width="65%"/>
- Detección de nodos con *MarcoPolo*
- Integración directa con __Tomcat__
- Integrado con Diaweb
- Versátil


## Status Monitor
<img src="img/screenshot-statusmonitor.png" alt="Vista de la herramienta statusmonitor" width="35%"/>
- Herramienta que permite evaluar el estado de los diferentes nodos presentes en la red
- Detección mediante *MarcoPolo*
- Elimina cuellos de botella
- Completamente asíncrono


## Funcionamiento

1. El cliente web solicita al nodo al que se ha conectado todos los miembros de la red con el servicio "statusmonitor".
2. El servidor utiliza el *binding* de Marco para realizar esta consulta
3. Se retorna la información y el cliente establece conexiones __WebSocket__ __directas__ con cada uno de los nodos.
4. El cliente recibe la información en directo, sin *polling*.


## Shell
<img src="img/loggermain.png" alt="Vista de la herramienta shell" width="80%"/>
- Permite realizar operaciones de depuración sencillas
- Ejecución completamente asíncrona (incluyendo la recolección de datos)

Note: WebSockets, Tornado, Ejemplo de ejecución asíncrona, Seguridad


## Resultado final

Arquitectura orientada a servicios
<img width="64%" src="img/capas.svg" alt="Vista conceptual de la arquitectura por capas del sistema"/>


## Estructura física

- 3 diseños
- Integración de todos los componentes principales en una única estructura
- Centralización de las funciones de red y alimentación eléctrica


## Prototipos iniciales

1. Inicialmente se plantea una estructura muy rudimentaria con separadores hexagonales (se descarta antes de comenzar su desarrollo)
2. El segundo diseño utiliza una estructura de metacrilato para sostener todos los nodos 

<img width="60%" src="img/prototipo1vistageneral.jpg"/>
<img width="19%" src="img/prototipo1vistaperfil.jpg"/>


## Propuesta final

- Estructura de metacrilato (del segundo diseño)
- Un único punto de red y alimentación

<ul class="images">
<br>
<li><img width="49%" src="img/general.jpg" alt="Vista de la estructura física"/></li>
<li><img width="49%" src="img/fuentedetalle.jpg" alt="Vista en detalle de la fuente de alimentación"/></li>
</ul>


## Propuesta final

Se han modificado varios componentes, como la instalación eléctrica.
<ul class="images">
<br>
<li><img width="23%" src="img/dc.jpg" alt="Vista del cable DC modificado"/></li>
<li><img width="23%" src="img/usb.jpg" alt="Vista del cable USB modificado"/></li>
<br>
<li><img width="35%" src="img/fusibles.jpg" alt="Vista de la placa de fusibles"/></li>
</ul>


## PCB

- Simplifica la instalación de los diferentes LEDs de cada nodo

<ul class="images">
<li><img width="30%" src="img/general-placa.jpg" alt="Vista general de la placa Raspberry Pi con el circuito impreso conectado"/></li>
<li><img width="30%" src="img/leds.jpg" alt="Vista de la placa en funcionamiento"/></li>
<li><img width="30%" src="img/vista2.jpg" alt="Vista en otra perspectiva del PCB"/></li>
</ul>


## PCB

<ul class="images">
<li><img width="40%" src="img/placaanverso.jpg" alt="Vista del anverso de la placa PCB"/></li>
<li><img width="40%" src="img/placareverso.jpg" alt="Vista del reverso de la placa PCB"/></li>
</ul>



# Herramientas utilizadas


## Mecanismos de evaluación

- Test unitarios
    - __Unittest__, __Pylint__
    - Facilitan el desarrollo y permiten detectar errores antes de que el código sea ejecutado
- Evaluaciones de usuario
- Pruebas de integración en entornos reales


## Evaluaciones de usuario

- Se han realizado evaluaciones a todos los tipos de usuario potencial del sistema (profesores, estudiantes, administradores)
- Varios tipos de evaluación (seguimiento continuo, diferentes dinámicas...)
- Documentadas como parte del proyecto
- Han probado ser uno de los mejores mecanismos para identificar necesidades


## Pruebas de integración en entornos reales

- Pruebas durante las diferentes fases del proyecto para determinar la compatibilidad del mismo con el entorno
- La mayor parte del desarrollo del proyecto se ha realizado en entornos reales
- Pruebas en diferentes condiciones:
    - Varios puntos de la red de la Facultad, redes domésticas
    - Equipos de aulas de informática, equipos personales, *workstations*, Raspberry Pi...


## Herramientas utilizadas

Orientación a eventos y programación en un único hilo

<img width="40%" src="img/threadcomparison.png" alt="Comparación de diferentes modelos de paralelismo"/>

Twisted y Tornado siguen este enfoque


## Interfaces web

- AJAX es utilizado minoritariamente
- La mayoría de las comunicaciones se realizan a través de *WebSockets*
    - Elimina cuellos de botella
    - Comunicación asíncrona bidireccional
- Bootstrap y jQuery para la funcionalidad básica
- d3.js para visualización de datos




## Integración

- *Hardware*
    - Máquinas virtuales
    - Equipos de escritorio y portátiles
    - __Raspberry Pi__
- *Software*
    - __Xubuntu__, __Ubuntu__
    - __Raspbian__
    - __Arch Linux ARM__
- Todos los paquetes *software* gestionan de forma transparente las diferencias entre cada configuración
- Compatible con init.d y systemd


## Gestión del proyecto

- Proceso incremental basado en prototipos
- Herramientas de gestión:
    - Redmine
    - Git


## TFG en números

- ~ 600 *commits*
- 500 horas de trabajo
- 7 paquetes públicos en __Pypi__
- 18 repositorios públicos en Bitbucket
- 3 lenguajes de programación principales y dos secundarios (Python, C, Bash, C++, Java)


## ¿Por qué este TFG?

- Sintetiza y expande los conocimientos en varias áreas de conocimiento
- Propone soluciones presentes en la infraestructura de la Facultad de Ciencias
- Propone un nuevo punto de vista a este tipo de clústers


## Conclusiones y líneas de trabajo futuro

- Mejoras en MarcoPolo y el resto de herramientas
- Estudio de implementación en las asignaturas propuestas
- Promoción del proyecto ([marcopoloproject.martinarroyo.net](http://marcopoloproject.martinarroyo.net))