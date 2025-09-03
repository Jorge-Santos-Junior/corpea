// Arquivo: theme-toggle.js

// Seleciona o botão e o corpo da página
const themeToggleButton = document.getElementById('theme-toggle');
const body = document.body;

// Verifica a preferência do usuário salva no localStorage
const currentTheme = localStorage.getItem('theme');

// Se houver uma preferência salva, aplica o tema
if (currentTheme === 'dark-mode') {
    body.classList.add('dark-mode');
    if (themeToggleButton) {
        themeToggleButton.textContent = '☀️'; // Muda o ícone para sol se o botão existir
    }
}

// Adiciona um "ouvinte" de evento de clique no botão
if (themeToggleButton) {
    themeToggleButton.addEventListener('click', () => {
        // Alterna a classe 'dark-mode' no corpo da página
        body.classList.toggle('dark-mode');

        // Verifica se a classe 'dark-mode' está presente para salvar a preferência
        if (body.classList.contains('dark-mode')) {
            localStorage.setItem('theme', 'dark-mode');
            themeToggleButton.textContent = '☀️'; // Muda o ícone para sol
        } else {
            localStorage.setItem('theme', 'light-mode');
            themeToggleButton.textContent = '🌙'; // Muda o ícone para lua
        }
    });
}