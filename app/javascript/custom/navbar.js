const btn = document.querySelector('.mobile-menu-btn');
const sidebar = document.querySelector('.sidebarz');
const sidebar = document.querySelectorAll('.nav-links li');

btn.addEventListener('click', () => {
	sidebar.classList.toggle('-translate-x-full');
})