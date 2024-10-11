
#include "Input.h"
#include <cassert>

#pragma comment(lib,"dinput8.lib")
#pragma comment(lib,"dxguid.lib")

void Input::Initialize(HINSTANCE hInstance, HWND hwnd) {
	HRESULT result;
	
	Comptr<IDirectInput8> directInput = nullptr;
	result = DirectInput8Create(
		hInstance, DIRECTINPUT_VERSION, IID_IDirectInput8,
		(void**)&directInput, nullptr);
	assert(SUCCEEDED(result));

	//キーボードデバイスの初期化
	result = directInput->CreateDevice(GUID_SysKeyboard, keyboard.GetAddressOf(), nullptr);
	assert(SUCCEEDED(result));

	//入力データ形式のセット
	result = keyboard->SetDataFormat(&c_dfDIKeyboard);
	assert(SUCCEEDED(result));
	//排他制御レベルのセット
	result = keyboard->SetCooperativeLevel(
		hwnd, DISCL_FOREGROUND | DISCL_NONEXCLUSIVE);
	assert(SUCCEEDED(result));
}

void Input::Updata() {
	//キーボード情報の取得開始
	keyboard->Acquire();
	//全キーの入力状態を取得する
	BYTE key[256] = {};
	keyboard->GetDeviceState(sizeof(key), key);
}