// JAApp.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include "JAApp.h"
using namespace std;


int main()
{	// definicja ciagu znakow 
	char szString[] = { 'A','G','I','K','S','Z', 'J', 0xFF }; 

	//printf("FindChar_1 %s\n", (FindChar_1() == 1 ? "Found J" : "Not Found J"));
	//printf("FindChar_2 %s\n", (FindChar_2() == 1 ? "Found J" : "Not Found J"));
	//printf("FindChar_3 %s\n", (FindChar_3(szString) ? "Found J" : "Not Found J"));
	//printf("FindChar_4 %s\n", (FindChar_4() == 1 ? "Found J" : "Not Found J"));
	//printf("FindChar_5 %s\n", (FindChar_5() == 1 ? "Found J" : "Not Found J"));
	//printf("FindChar_6 %s\n", (FindChar_6() == 1 ? "Found J" : "Not Found J"));
	printf("MyProcedure %s\n", (MyProcedure() == 1 ? "Found J" : "Not Found J"));
	int amountOfReads = 20;

	for(int i = 0; i < amountOfReads; i++)
		printf("Czas przetwarzania: %i\n", ReadTime_1());

	std::cout << endl;

	for(int i = 0; i < amountOfReads; i++)
		printf("Czas przetwarzania: %i\n", ReadTime_2());

	MessageBox(NULL, L"Wyciągnij wnioski", L"Lab. 2", MB_OK);
		

	/*
	//call MyProc1
	int x = 9, y = 5, z = 0;
	z = MyProc1(x, y);
	cout << z << endl;

	//dynamicly call MyProc2
	HINSTANCE lib = LoadLibraryA("JADll");
	int(_stdcall *MyProc2)(void) = (int(_stdcall*)(void))GetProcAddress(lib, "MyProc2");
	MyProc2();
	*/
}
