# Visualization of large amount of data for personalized medicine<br>[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![DOI:10.5753/encompif.2020.11062](https://zenodo.org/badge/DOI/10.5753/encompif.2020.11062.svg)](https://doi.org/10.5753/encompif.2020.11062) [![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/Wanghley/PIBIC-Strategies-Data-Visualization-Medicine/) ![version](https://img.shields.io/badge/version-v1.0.0--alpha-blue)<br>
Project of Scientific Research in the field of biomedical engineering with the aim of build a end-to-end system of collection,analysis and visualization of biomedical data related to neuromotors diseases as Parkinson Disease (PD) - the main studied disease in this project.

## Getting Started
This research is divided in two different repositories. This one is focused on the control of the collection device, data receiving, data storage, processing, and visualization. In the other hand, the second repository - [Inertial Data Collection Device](https://github.com/Wanghley/Inertial-Data-Collection-Device) - is focused on the hardware of inertial data collection and its firmware.

We made it with two different visions: (1) aimed to research studies; and (2) real-world data collection. 
<br>Furthermore, you can use this software in CLI mode or GUI mode. You can select the best option for your confort and requisites.

>If you have any question, issue or sugestion feel free to send us a report on the [discussion tab](https://github.com/Wanghley/PIBIC-Strategies-Data-Visualization-Medicine/discussions) here on GitHub.

In order to use or develop this project you must install mainly ```pybluez``` and ``PySide2``, since they are the core used in the process of this project at all.

### Prerequisites

You need to install these things to run the project

```properties
sudo apt-get install python3-pyqt5 libbluetooth-dev bluetooth
pip3 install PySide2 pybluez
```

### Executing
You need to remember that we have two different ways of execute the software, depending in which mode you want to use.
#### CLI

In order to execute the CLI interface you must edit the line 38 of the file `src/cli/main.py` changing the address of the bluetooth device as bellow:

```python
bd_addr = "00:11:22:33:44:55"
```

Then, just run on terminal:

```properties
python3 src/cli/main.py
```
#### GUI
In order to execute the the GUI interface you must execute the following command on your terminal.
```properties
python3 src/app/main.py
```
Then you going to have the interface running on your computer.


## Built With

* [PySide2 5.15.2](https://pypi.org/project/PySide2/) - Cross-platform GUI toolkit Qt
* [PyBluez 0.23](https://pypi.org/project/PyBluez/) - Bluetooth Python extension module
* [Python 3.6.9](https://www.python.org/downloads/release/python-369/) - High-level programming language
* [Qt Creator 4.14.0](https://github.com/qt-creator/qt-creator) - cross-platform, integrated development environment (IDE)
* [Qt 5.15.2](https://wiki.qt.io/Qt_5.15_Release) -  cross-platform application development framework

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/Wanghley/8d237a5e568b4e3149c0166dd010e375) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Wanghley Soares Martins** - *junior researcher* - [wanghley](https://github.com/wanghley)
* **Fábio Henrique Monteiro Oliveira** - *research advisor* - [oliveirafhm](https://github.com/oliveirafhm)

See also the list of [contributors](https://github.com/Wanghley/PIBIC-Strategies-Data-Visualization-Medicine/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Built to impact the diagnosis of Parkinson's Disease all around the world
* To understand fully how the code works you must have a background of server-client communication
* You must understand that all communication process happens through Bluetooth. Consequently, a previous study of the protocol can help
* Feel free to use the code but do not forget to reference us
