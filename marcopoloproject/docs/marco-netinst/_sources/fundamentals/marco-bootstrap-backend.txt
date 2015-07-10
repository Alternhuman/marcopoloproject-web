marco-bootstrap-backend
=======================

backend
-------

The backend displays an interface with all the information about scheduled operations and the nodes in the network at the moment of lauch. Operations can be added using the interface. The database keeps track of all operations and allows the cancellation of them.

slave
-----

The slave listens for incoming connections and accepts them only if the server certificate is valid. Otherwise the connection is refused.

See the :ref:`reference <marcobootstrapbackendreference>` for more information.