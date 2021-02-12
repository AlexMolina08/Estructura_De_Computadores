//------------------------------------------------------------------------
// excepciones.cc
//------------------------------------------------------------------------

#include <chrono>
#include <iostream>
#include <string>

using namespace std::literals;

//------------------------------------------------------------------------

std::string explotar = "##########################################\n"
                       "#           booooooooooooom!!!           #\n"
                       "##########################################\n",
          desactivar = "##########################################\n"
                       "#         bomba desactivada :)           #\n"
                       "##########################################\n";

//------------------------------------------------------------------------

template <typename T> void comprobar(const T& buena, const char* msg)
{
	T clave;
	std::cout << "Introduzca " << msg << ": ";
	auto t1 = std::chrono::high_resolution_clock::now();
	std::cin >> clave;
	auto t2 = std::chrono::high_resolution_clock::now();
	if (clave != buena || (t2 - t1) > 5s)
		throw explotar;
}

//------------------------------------------------------------------------

int main()
{
	std::string clave1 = "hola";
	int clave2 = 1234;
	
	try
	{
		comprobar(clave1, "contraseña");
		comprobar(clave2, "pin");
		throw desactivar;
	}
	catch(std::string& s)
	{
		std::cout << s << std::endl;
	}
}

//------------------------------------------------------------------------

