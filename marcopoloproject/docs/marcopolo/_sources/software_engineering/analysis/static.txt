Vista estática de la aplicación
===============================

Una vista estática de la arquitectura permite conceptualizar las diferentes propiedades de los diferentes componentes así como las relaciones entre los mismos. La arquitectura de MarcoPolo se compone de los siguientes subpaquetes:

Paquete Marco
-------------

.. image:: ../img/analisis_Marco.*
    :align: center
    :alt: Paquete de análisis Marco

El paquete se compone de una interfaz (*binder*) que actuará como frontera para que las diferentes aplicaciones puedan utilizar la funcionalidad de la aplicación. Una clase de control realizará las operaciones solicitadas y una tercera procesará los diferentes objetos de negocio que se obtienen de la realización de estas operaciones.

Paquete Polo
------------

.. image:: ../img/analisis_Polo.*
    :align: center
    :alt: Paquete de análisis Polo

El paquete Polo cuenta con dos interfaces claramente diferenciadas. Una de ellas actúa como *binder* para que la funcionalidad ofrecida pueda ser aprovechada por las diferentes aplicaciones presentes en el sistema, siendo la otra la interfaz que procesa los diferentes mensajes de consulta. Una clase de control aglutina todas las instancias del rol Polo, independientes entre sí, que controlan las diferentes entidades (servicios).

Bindings
--------

Ambos bindings siguen una estructura similar, con dos interfaces que posibilitan la interconexión de una aplicación con la instancia de Marco o Polo, una clase de control actúa de mediador entre estas dos clases, realizando diferentes funciones como la validación de los diferentes parámetros introducidos por el usuario o diferentes operaciones auxiliares.

Binding de Marco
~~~~~~~~~~~~~~~~

.. image:: ../img/analysis_marco_binding.*
	:align: center
	:alt: Paquete de análisis del binding de Marco

Binding de Polo
~~~~~~~~~~~~~~~

.. image:: ../img/analysis_polo_binding.*
	:align: center
	:alt: Paquete de análisis del binding de Polo

En el caso del *binding* de Polo existe una clase de entidad que realizará operaciones de consulta a la base de datos de los diferentes usuarios del sistema, tal y como se define en los requisitos funcionales y no funcionales.

.. TODO Referencia al requisito

Utilidades
----------

Las diferentes utilidades se basan en una estructura común. Dado que no se plantea el consumo de información por ninguna de las herramientas creadas, no se plantea la inclusión de clases entidad durante esta fase de análisis.

.. image:: ../img/analysis_node_discovery.*
	:align: center
	:alt: Análisis de la herramienta de descubrimiento

