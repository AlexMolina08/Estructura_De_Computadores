#include <iostream>
#include <chrono>
#include <string>

using namespace std::literals;

void explotar()
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
	
	auto t1 = std::chrono::steady_clock::now();
	std::cout << "Introduce " << msg << ": ";
	std::cin >> nuevo;
	auto t2 = std::chrono::steady_clock::now();
	
	if (nuevo != viejo || (t2 - t1) > 5s)
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
