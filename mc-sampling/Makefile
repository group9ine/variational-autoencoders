CXX = g++
CXXFLAGS = -Wall -Wextra -O3

main: main.o System.o
	${CXX} ${CXXFLAGS} main.o System.o -o main
main.o: main.cpp System.h
	${CXX} ${CXXFLAGS} -c main.cpp
System.o: System.cpp System.h
	${CXX} ${CXXFLAGS} -c System.cpp
clean:
	rm -f *.o
