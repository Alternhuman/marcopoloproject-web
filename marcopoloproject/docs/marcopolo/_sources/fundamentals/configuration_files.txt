.. _configuration_files:

Configuration files
-------------------

The behaviour of MarcoPolo is defined almost in its entirety by a set of configuration files, stored in a single folder (``/etc/marcopolo``). The main files and folders are the following:

.. code::

	/etc/marcopolo/
	|── marco
	|   |── marco.cfg
	|── polo
	    |── polo.cfg
	    |── services
	        |── deployer
	        |── marcobootstrap
        	...

- The ``marco.cfg`` and ``polo.cfg`` files determine the particular behaviour of each of the daemons. The listening ports, multicast groups and several other parameters are defined here.

- The services folder stores the information about the static services provided by the machine. Each one is located in a file with no extension, and the information is encoded in JSON strings.

See :doc:`/configuration/basics` for more details on the configuration of the services and examples.