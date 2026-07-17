@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: create filename.txt
    exit /b 1
)

if not exist "%~1" (
    echo File "%~1" not found.
    exit /b 1
)

for /f "usebackq delims=" %%a in ("%~1") do (
    set "name=%%a"

    rem Replace spaces with underscores
    set "name=!name: =_!"

    echo Creating !name!.cpp
    echo Creating !name!_in.txt

    (
        echo #include ^<bits/stdc++.h^>
        echo using namespace std;
        echo #define int long long
        echo.
        echo.
        echo #ifndef ONLINE_JUDGE
        echo #define LOCAL
        echo #endif
        echo.
        echo #ifdef LOCAL
        echo.
        echo #define debug^(x^) cerr ^<^< #x ^<^< " = " ^<^< x ^<^< endl;
        echo.
        echo template^<class T^>
        echo void debugVector^(vector^<T^> v^)
        echo {
        echo     cerr ^<^< "[ ";
        echo     for^(auto x : v^)
        echo         cerr ^<^< x ^<^< " ";
        echo     cerr ^<^< "]\n";
        echo }
        echo.
        echo #define dbgVec^(x^) cerr ^<^< #x ^<^< " = ", debugVector^(x^);
        echo.
        echo #else
        echo.
        echo #define debug^(x^)
        echo #define dbgVec^(x^)
        echo.
        echo #endif
        echo.
        echo.
        echo void sol^(^)
        echo {
        echo.
        echo }
        echo.
        echo.
        echo int32_t main^(^)
        echo {
        echo     ios::sync_with_stdio^(false^);
        echo     cin.tie^(nullptr^);
        echo.
        echo     int test = 1;
        echo     cin ^>^> test;
        echo     while^(test--^ )
        echo     {
        echo         sol^(^);
        echo     }
        echo.
        echo     return 0;
        echo }
    ) > "!name!.cpp"

    type nul > "!name!_in.txt"
)

echo Done.
pause
