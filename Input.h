#define DIRECTINPUT_VERSION 0x0800
#pragma once
#include <dinput.h>
#include <windows.h>

#include <wrl.h>


class Input
{
public:
	template <class T> using Comptr = Microsoft::WRL::ComPtr<T>;
public:
	void Initialize(HINSTANCE hInstance, HWND hwnd);

	void Updata();
private:
	Comptr<IDirectInputDevice8> keyboard;
	Comptr<IDirectInput8> directInput;
};

