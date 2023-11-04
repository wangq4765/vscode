#include "windows.h"  
#include "iostream"  
  
using namespace std;  
  
DWORD WINAPI FunProc1(LPVOID lpParameter);  
DWORD WINAPI FunProc2(LPVOID lpParameter);  
  
int ticket = 100;  
HANDLE hMutex;   //定义互斥对象  
int main()  
{  
    HANDLE hThread1;  
    HANDLE hThread2;  
    hMutex = CreateMutex(NULL, FALSE, NULL);    //创建互斥对象，并且该线程不拥有他（因为第二个参数为false）  
    hThread1 = CreateThread(NULL, 0, FunProc1, NULL, 0, NULL);  
    hThread2 = CreateThread(NULL, 0, FunProc2, NULL, 0, NULL);  
    CloseHandle(hThread1);  
    CloseHandle(hThread2);  
    Sleep(1000);// 让主线程睡眠1秒 ，不然子线程来不及执行  
    return 0;  
}  
  
DWORD WINAPI FunProc1(LPVOID lpParameter)  
{  
    while (TRUE)  
    {  
        WaitForSingleObject(hMutex, INFINITE);   //申请互斥对象的所有权（申请钥匙，得到钥匙）  
        if (ticket>0)  
        {  
            Sleep(1);  
            cout << "ticket 1:" << ticket-- << endl;  
        }  
        else  
            break;  
        ReleaseMutex(hMutex);//释放互斥对象的所有权（放弃钥匙，不再拥有）  
    }  
    return 0;  
}  
DWORD WINAPI FunProc2(LPVOID lpParameter)  
{  
    while (TRUE)  
    {  
        WaitForSingleObject(hMutex, INFINITE);  
        if (ticket>0)  
        {  
            Sleep(1);  
            cout << "ticket 2:" << ticket-- << endl;  
        }  
        else  
            break;  
        ReleaseMutex(hMutex);  
    }  
    return 0;  
}  
