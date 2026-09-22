document.addEventListener("DOMContentLoaded", () => {
  const container = document.querySelector("#prefooter-mobile");
  if (!container) return;

  const slider = container.querySelector(".bxslider-prefooter");
  if (!slider) return;

  const slides = Array.from(slider.querySelectorAll("li"));
  if (slides.length < 2) return;

  const firstClone = slides[0].cloneNode(true);
  const lastClone = slides[slides.length - 1].cloneNode(true);

  slider.appendChild(firstClone);
  slider.insertBefore(lastClone, slides[0]);

  let allSlides = Array.from(slider.querySelectorAll("li"));
  let index = 1;
  let slideWidth = slides[0].offsetWidth;

  function setPosition(animate = true) {
    slider.style.transition = animate ? "transform 0.4s ease" : "none";
    slider.style.transform = `translateX(${-index * slideWidth}px)`;
  }

  function next() {
    if (index >= allSlides.length - 1) return;
    index++;
    setPosition();
  }

  function prev() {
    if (index <= 0) return;
    index--;
    setPosition();
  }

  slider.addEventListener("transitionend", () => {
    if (allSlides[index] === firstClone) {
      index = 1;
      setPosition(false);
    }
    if (allSlides[index] === lastClone) {
      index = allSlides.length - 2;
      setPosition(false);
    }
  });

  container.addEventListener("click", (e) =>  {
    const rect = container.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const edge = 40;

    if (x < edge) prev();
    else if (x > rect.width - edge) next();
  });

  let startX = null;
  container.addEventListener("touchstart", e => {
    startX = e.touches[0].clientX;
  }, { passive: true });

  container.addEventListener("touchend", e => {
    if (startX === null) return;
    const delta = e.changedTouches[0].clientX - startX;
    if (delta > 40) prev();
    else if (delta < -40) next();
    startX = null;
  });

  window.addEventListener("resize", () => {
    slideWidth = slides[0].offsetWidth;
    setPosition(false);
  });

  setPosition(false);
});
