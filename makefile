all:
	mkdir -p bin
	g++ -std=c++17 -O2 -o bin/jp_test3 src/jp_test3.cpp
	bin/jp_test3 >jp_test3.generated.in
	rm bin/*

purge:
	rm *.generated.in
