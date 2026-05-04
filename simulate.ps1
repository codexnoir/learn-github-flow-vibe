$ErrorActionPreference = "Stop"

Write-Host "Creating branches..."
git checkout main
git checkout -b feature/navbar
git checkout main
git checkout -b feature/footer

# --- ITERATION 1 ---
Write-Host "Iteration 1"
git checkout feature/navbar
$html = Get-Content index.html -Raw
$html = $html -replace '<body>', "<body>`n    <nav class=`"navbar`">`n        <ul>`n            <li><a href=`"#`">Home</a></li>`n            <li><a href=`"#`">About</a></li>`n        </ul>`n    </nav>"
Set-Content index.html $html -Encoding UTF8
git add .
git commit -m "feat(navbar): add navigation HTML structure"

git checkout feature/footer
$html = Get-Content index.html -Raw
$html = $html -replace '</body>', "    <footer class=`"footer`">`n        <p>Footer Placeholder</p>`n    </footer>`n</body>"
Set-Content index.html $html -Encoding UTF8
git add .
git commit -m "feat(footer): add footer HTML structure"

# --- ITERATION 2 ---
Write-Host "Iteration 2"
git checkout feature/navbar
Add-Content style.css "`n.navbar { background: rgba(30, 41, 59, 0.9); padding: 1rem; border-bottom: 1px solid rgba(255,255,255,0.1); backdrop-filter: blur(10px); }`n.navbar ul { list-style: none; display: flex; gap: 2rem; justify-content: center; margin: 0; padding: 0; }`n.navbar a { color: var(--text-primary); text-decoration: none; font-weight: 600; transition: color 0.3s; }" -Encoding UTF8
git add .
git commit -m "feat(navbar): add basic styles for navigation"

git checkout feature/footer
Add-Content style.css "`n.footer { padding: 2rem; text-align: center; margin-top: 4rem; border-top: 1px solid rgba(255,255,255,0.1); width: 100%; }" -Encoding UTF8
git add .
git commit -m "feat(footer): add basic layout for footer"

# --- ITERATION 3 ---
Write-Host "Iteration 3"
git checkout feature/navbar
$html = Get-Content index.html -Raw
$html = $html -replace '<nav class="navbar">', "<nav class=`"navbar`">`n        <div class=`"logo`">VibeFlow</div>"
Set-Content index.html $html -Encoding UTF8
git add .
git commit -m "feat(navbar): add logo element"

git checkout feature/footer
$html = Get-Content index.html -Raw
$html = $html -replace '<p>Footer Placeholder</p>', "<div class=`"socials`">`n            <a href=`"#`">Twitter</a> | <a href=`"#`">GitHub</a> | <a href=`"#`">LinkedIn</a>`n        </div>`n        <p>Footer Placeholder</p>"
Set-Content index.html $html -Encoding UTF8
git add .
git commit -m "feat(footer): add social media links"

# --- ITERATION 4 ---
Write-Host "Iteration 4"
git checkout feature/navbar
Add-Content style.css "`n.navbar { display: flex; justify-content: space-between; align-items: center; padding: 1rem 5%; }`n.navbar a:hover { color: var(--accent); }`n.logo { font-size: 1.5rem; font-weight: 800; background: linear-gradient(to right, #60a5fa, #a78bfa); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }" -Encoding UTF8
git add .
git commit -m "style(navbar): add hover effect on links and style logo"

git checkout feature/footer
$html = Get-Content index.html -Raw
$html = $html -replace '<p>Footer Placeholder</p>', "<p class=`"copyright`">&copy; 2026 VibeFlow Demo. All rights reserved.</p>"
Set-Content index.html $html -Encoding UTF8
git add .
git commit -m "docs(footer): add copyright text"

# --- ITERATION 5 ---
Write-Host "Iteration 5"
git checkout feature/navbar
$css = Get-Content style.css -Raw
$css = $css -replace '\.navbar \{', ".navbar { position: sticky; top: 0; z-index: 100;"
Set-Content style.css $css -Encoding UTF8
git add .
git commit -m "feat(navbar): make navigation sticky"

git checkout feature/footer
Add-Content style.css "`n.footer { background: rgba(15, 23, 42, 0.8); backdrop-filter: blur(5px); }`n.socials { margin-bottom: 1rem; }`n.socials a { color: var(--accent); text-decoration: none; font-weight: 600; margin: 0 0.5rem; transition: opacity 0.3s; }`n.socials a:hover { opacity: 0.7; }`n.copyright { color: var(--text-secondary); font-size: 0.9rem; }" -Encoding UTF8
git add .
git commit -m "style(footer): refine footer colors and add hover effects"

Write-Host "Simulation complete. Check git log --all --graph --decorate --oneline"
