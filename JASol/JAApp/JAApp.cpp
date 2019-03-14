// JAApp.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <Windows.h>
using namespace std;

extern "C" int _stdcall MyProc1(DWORD x, DWORD y);

int main()
{

	//call MyProc1
	int x = 9, y = 5, z = 0;
	z = MyProc1(x, y);
	cout << z << endl;

	//dynamicly call MyProc2
	HINSTANCE lib = LoadLibraryA("JADll");
	int(_stdcall *MyProc2)(void) = (int(_stdcall*)(void))GetProcAddress(lib, "MyProc2");
	MyProc2();
	
}
