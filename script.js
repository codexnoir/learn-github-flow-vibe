document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('magic-btn');
    const card = document.querySelector('.card');

    btn.addEventListener('click', () => {
        card.classList.toggle('magic-effect');
        if (card.classList.contains('magic-effect')) {
            btn.textContent = 'Revert Magic 🌟';
        } else {
            btn.textContent = 'Apply Magic ✨';
        }
    });
});
