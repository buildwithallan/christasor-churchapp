const btn = document.querySelector('.mobile-menu-btn');
const sidebar = document.querySelector('.sidebarz');

btn.addEventListener('click', () => {
	sidebar.classList.toggle('-translate-x-full');
})