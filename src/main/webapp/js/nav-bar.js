function toggleMenu() {
    document.getElementById("navLinks").classList.toggle("active");
}
document.addEventListener("DOMContentLoaded", () => {
    const box = document.getElementById("userBox");
    if (!box) return;

    box.addEventListener("click", () => {
        box.classList.toggle("active");
    });

    // Close when clicking outside
    document.addEventListener("click", (e) => {
        if (!box.contains(e.target)) {
            box.classList.remove("active");
        }
    });
});
