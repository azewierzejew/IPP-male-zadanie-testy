all:
	g++ -std=c++17 -O2 -o jp_test3.generator jp_test3.generator.cpp
	./jp_test3.generator >jp_test3.generated.in
	rm *.generator

purge:
	rm *.generated.in
