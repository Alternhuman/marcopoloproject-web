.. marco-netinst documentation master file, created by
   sphinx-quickstart on Sun Jun 14 13:55:19 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to marco-netinst's documentation!
=========================================

marco-netinst an unattended Raspberry Pi installation system which effectively replaces a PXE environment (not supported by the Raspberry Pi) for the installation and upgrade of the system. It follows a *zeroconf* approach, using MarcoPolo to detect an OS image mirror inside a local area network. It, however, can also be configured to use any server identified by its IP/DNS name.

marco-netinst is the common name for three tools:

- **marco-netinst**: is the unattended installer, which is a fork of the `raspbian-ua-netinst project <https://github.com/debian-pi/raspbian-ua-netinst>`_ that includes Arch Linux support, MarcoPolo integration, double validation HTTPS connection (the server does only provide the files to those nodes that provide a valid certificate). It also includes a set of tools to build a valid installation image. 

- **marco-bootstrap-backend**: An administrative interface that allows a manager to execute upgrade operations and reboots of the system. It is also expandable to include more functionality. It has two roles:
    
    + **backend**: Provides the administrative interface and keeps track of all operations.
    + **slave**: A daemon in every Raspberry that carries the operations commanded by the backend.
      
Contents
--------

.. toctree::
    :maxdepth: 2

    fundamentals/intro
    reference/intro
    software_engineering/intro         




Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

