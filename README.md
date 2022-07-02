# AntlrAda

ANTLR4 grammar for Ada programming language.

Based on LRM: [Ada '83 Language Reference Manual](http://archive.adaic.com/standards/83lrm/html/lrm-TOC.html)

Includes 2 example files for testing.

## Usage

### Prerequisites

You have Java installed and ANTLR4 set up.

### Generate parser code

```
java org.antlr.v4.Tool Ada.g4
```

### Compile

```
javac Ada*.java
```

### Run TestRig

```
cat numbers.adb | java org.antlr.v4.gui.TestRig Ada program -gui
```

