The Botball® Educational Robotics Program engages middle and high school aged students in a team-oriented robotics competition, and serves as a perfect way to meet today’s new common core standards.
By exposing students to an inquiry-based, learn-by-doing activity that appeals to their hearts as well as their minds, Botball® addresses our nation’s need for a well-prepared, creative, yet disciplined workforce with leadership and teamwork experience.

KIPR has been developing customer [hardware and software](https://www.kipr.org/kipr/hardware-software) for many years to offer students with an easy to use controller. The latest itteration of the controller is the **Wombat**.

# Installer

This repository brings togeather the submodules that togeather proveds the functionality of the controller and provides a single point for instalation. Submodules can can be updated independently and released as a single update through this repository.

Miscilanious instalation functions are also accomplished by this repository including configuring the services to launch on boot.

# Submodules Functions

The following submodules are ordered from general software only requirements down to hardware dependant.

[Web Interface](https://github.com/kipr/harrogate) - Harrogate is the web UI for the controller. This module is also responsible for file management on the controller.

[Compiler Utility](https://github.com/kipr/pcompiler/tree/use_Qt4) - pccompiler is an automatic source code compiler. Given a set of input files, pcompiler will attempt to create an executable out of them.

[Built-in Interface](https://github.com/kipr/botui) - BotUI provides an interface on the built in touch screen display screen of the controller.

[Hardware Communication]()

[Update Functionality]()

# Installation

The controller is only compatable with the Linuix operarating system.
### Verified OS
Ubuntu Server 20.04.2 LTS


```
git clone --recurse-submodules https://github.com/kipr/botball-controller

sudo chmod +x botball-controller/install.sh

sudo botball-controller/install.sh
```
