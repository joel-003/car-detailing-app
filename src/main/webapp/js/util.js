function autoHide(elementId, delay = 3000) {
    const el = document.getElementById(elementId);
    if (el) {
        setTimeout(() => {
            el.classList.add("fade-out");
            setTimeout(() => el.style.display = "none", 600); // wait for fade
        }, delay);
    }
}
