# REST Api Selenium tests

A project to demonstrate the use of [RESTinstance](https://github.com/asyrjasalo/RESTinstance) and Selenium2library for testing JSON REST APIs

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need:


[Python 3](https://www.python.org/downloads/)

[RESTinstance library](https://github.com/asyrjasalo/RESTinstance)
```
    pip install --upgrade RESTinstance
```

[Selenium2Library](https://github.com/robotframework/Selenium2Library)
```
    pip install --upgrade robotframework-selenium2library
```
[SeleniumHQ browser drivers](https://www.seleniumhq.org/download/)



### Installing and Running the tests

To get the report simply clone it

```
    git clone https://github.com/sqilz/REST-Api-Selenium-tests.git
```

Execute ```run.bat``` or ```run.sh``` to run the tests or

Navigate into the directory and run the following command

```
    robot -d results tests/REST.robot
```

## Authors

* **Przemysław Hendel** -  [sqilz](https://github.com/sqilz)

## Acknowledgments

* [Anssi Syrjäsalo](https://github.com/asyrjasalo/) creator of RESTinstance

