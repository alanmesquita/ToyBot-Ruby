# ToyBot Ruby

## Challenge
Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```
The toy robot must not fall off the table during movement.
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```

This is a implementation of ToyBot
## Dependences
This project was made using `ruby:2.3.1`.

I justi using `rspec` with external lib.

## Usage
If you have `Docker` and `docker-compose` just run:
```
$ make
```
If you don't have just run:
```
$ ./bot
```
## Test
If you have `Docker` and `docker-compose` just run:
```
$ make test
```
If you don't have just run:
```
$ bundler exec rspec spec
```

## Note
If this was useful to you, a star!
