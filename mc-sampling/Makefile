CXX = g++
CXXFLAGS = -Wall -Wextra -pedantic-errors -O3

main: src/main.o src/System.o
	${CXX} ${CXXFLAGS} src/main.o src/System.o -o main
main.o: src/main.cpp src/System.h
	${CXX} ${CXXFLAGS} -c src/main.cpp
System.o: src/System.cpp src/System.h
	${CXX} ${CXXFLAGS} -c src/System.cpp
clean:
	rm -f src/*.o
