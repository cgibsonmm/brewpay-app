const toggleMobileNav = () => {
  dropdown.classList.toggle("hidden");
};

let navBtn = document.querySelector("#mobile");
let dropdown = document.querySelector("#dropdown");

navBtn.addEventListener("click", toggleMobileNav);
