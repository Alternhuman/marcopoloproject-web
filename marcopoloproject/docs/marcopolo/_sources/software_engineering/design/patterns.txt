Patrones de diseño destacados
=============================

- El uso del patrón reactor por parte del *framework* **Twisted** optimiza el rendimiento de la aplicación de forma significativa. Este patrón está construido sobre el patrón singleton.

- Gracias al uso del patrón *Factory* es posible abstraer un protocolo del canal de comunicación. Gracias a ello ha sido posible crear un *binding* para **Polo** que funcione sobre canales de comunicación seguros e inseguros. 