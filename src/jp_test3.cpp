#include <cstdio>
#include <cstdlib>
#include <vector>
const int n = 2000;
const int ile = 10;
char s[ile][n+6];
void write(const char* operation, int nr, int len) {
	printf("%s ", operation);
	for (int i=0; i<len; i++) putchar(s[nr][i]);
	puts("");
}
void write2(const char* operation, int nr, int len, unsigned long long arg) {
	printf("%s ", operation);
	for (int i=0; i<len; i++) putchar(s[nr][i]);
	putchar(' ');
	printf("%llu\n", arg);
}
void write3(const char* operation, int n1, int len1, int n2, int len2) {
	printf("%s ",operation);
	for (int i=0; i<len1; i++) putchar(s[n1][i]);
	putchar(' ');
	for (int i=0; i<len2; i++) putchar(s[n2][i]);
	puts("");
}
const char* operations[6] = { "DECLARE", "REMOVE", "VALID", "ENERGY", "ENERGY", "EQUAL" };
unsigned long long random_ull() {
	unsigned long long ret = 0;
	for (int i=0; i<15; i++) {
		unsigned long long x = rand(), y = rand();
		ret = ret*x + y;
	}
	return ret;
}
int main() {
	srand(2137);
	for (int k=0; k<ile; k++) {
		for (int i=0; i<n; i++) s[k][i] = rand()%4+'0';
		//puts(s[k]);
	}
	int test = 200000;
	write("# Test wydajnościowy", 0, 0);
	while (test--) {
		int typ = rand()%6;
		if (typ < 4) write(operations[typ], rand()%ile, rand()%n+1);
		else if (typ == 4) {
			write2(operations[typ], rand()%ile, rand()%n+1, random_ull());
		} else if (typ == 5) {
			write3(operations[typ], rand()%ile, rand()%n+1, rand()%ile, rand()%n+1);
		}
	}
}
