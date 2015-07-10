Paquete Polo
============

.. figure:: ../img/polo_package.*
    :align: center

    El paquete Polo include una clase polod que será la encargada de la creación y control del resto de clases, que implementan la funcionalidad a proveer. La clase Polo gestionará todos los aspectos de gestión de servicios y las clases PoloBinding, PoloBindingSSL y PoloBindingSSLFactory proveerán la interconexión con los diferentes *bindings*. La diferencia entre la clase PoloBinding y PoloBindingSSL es que la primera no utiliza encriptación en los mensajes intercambiados. No es utilizada por defecto en el sistema. 
