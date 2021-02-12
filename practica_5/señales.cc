#include <unistd.h>
#include <csignal>
#include <iostream>
#include <string>

void explotar(int i = 0)
{
	std::cout << "##########################\n"
	             "########## boom ##########\n"
	             "##########################\n";
	exit(1);
}

void desactivar()
{
	std::cout << "##########################\n"
	             "###### desactivada #######\n"
	             "##########################\n";
	exit(0);
}

template<typename T> 
void comparar(const T& viejo, const char* msg)
{
	T nuevo;
	
	signal(SIGALRM, explotar);
	alarm(5);
	std::cout << "Introduce " << msg << ": ";
	std::cin >> nuevo;
	signal(SIGALRM, SIG_DFL);
	
	if (nuevo != viejo)
		explotar();
}

int main()
{
	std::string clave1 = "hola";
	int clave2 = 1234;
	
	comparar(clave1, "contraseña");
	comparar(clave2, "pin");
	desactivar();
}
