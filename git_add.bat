@echo off
echo.
echo ============================================
echo   Git Add + Commit + Push Helper
echo ============================================
echo.

echo [1/3] Adding files...
git add index.html timer-icon.png manifest.json README.md .gitignore git_add.bat

if errorlevel 1 (
    echo.
    echo [ERROR] git add failed!
    pause
    exit /b 1
)

echo [2/3] Committing...
git commit -m "add custom home screen icon"

if errorlevel 1 (
    echo.
    echo [WARNING] Nothing new to commit, or commit failed.
    pause
    exit /b 1
)

echo [3/3] Pushing to GitHub...
git push

if errorlevel 1 (
    echo.
    echo [ERROR] git push failed. Check internet or credentials.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   SUCCESS! Changes pushed to GitHub.
echo   - Wait 20-30 seconds for GitHub Pages
echo   - Delete old home screen icon on iPhone
echo   - Re-add via Safari Share button
echo ============================================
echo.
pause
