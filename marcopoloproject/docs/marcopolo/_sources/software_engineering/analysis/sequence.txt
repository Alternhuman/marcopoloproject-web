Diagramas de secuencia
======================

Solicitud de token de acceso y publicación de servicio
------------------------------------------------------

.. figure:: ../img/Token_Request.*
	:align: center

Los usuario serán identificados por un *token* asignado a su usuario de forma única, y que deberán adjuntar a toda petición realizada a la instancia de Polo. La solicitud de dicho token no es una fase trivial, dado que el token se solicita para un UID, pudiendo ser el solicitante un atacante que desee suplantar la identidad de otro usuario. En lugar de retornar el *token* en el mensaje de respuesta, se almacena el token en el directorio ``$HOME/.polo`` con permisos de acceso restringidos al propietario de dicha carpeta y en el mensaje de respuesta únicamente se indica el resultado exitoso de la operación. De esta forma, el token es creado pero únicamente será aprovechable por el usuario al que corresponda el UID, por lo que la única acción que un atacante puede realizar es solicitar la creación de un token para otro usuario (y en caso de que realice esta acción, no se sobreescribirá el *token* creado anteriormente), por lo que el daño que puede causar es nulo.