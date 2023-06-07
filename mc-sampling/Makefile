CXX = g++
CXXFLAGS = -Wall -Wextra -pedantic-errors -Wno-maybe-uninitialized -O3

main: src/main.o src/metropolis.o src/gamma.o src/polymer.o src/fake.o
	${CXX} ${CXXFLAGS} src/main.o src/metropolis.o src/fake.o \
		src/gamma.o src/polymer.o -o main
main.o: src/main.cpp src/polymer.hpp src/gamma.hpp src/fake.hpp
	${CXX} ${CXXFLAGS} -c src/main.cpp
metropolis.o: src/metropolis.cpp src/metropolis.hpp
	${CXX} ${CXXFLAGS} -c src/metropolis.cpp
gamma.o: src/gamma.cpp src/gamma.hpp
	${CXX} ${CXXFLAGS} -c src/gamma.cpp
polymer.o: src/polymer.cpp src/polymer.hpp
	${CXX} ${CXXFLAGS} -c src/polymer.cpp
fake.o: src/fake.cpp src/fake.hpp
	${CXX} ${CXXFLAGS} -c src/fake.cpp
clean:
	rm -f src/*.o
