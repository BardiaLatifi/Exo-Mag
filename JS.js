document.addEventListener('DOMContentLoaded', function () {
  // Generate navigation items from h2 and h3
  const headings = document.querySelectorAll('.description h2, .description h3');
  const navigationContainer = document.querySelector('#description-heading1 .d-inline-flex');

  headings.forEach((element, key) => {
    const scrollMarker = document.createElement('div');
    scrollMarker.id = `description-heading1-scroll${key}`;
    element.insertAdjacentElement('afterend', scrollMarker);

    if (element.innerText.trim()) {
      const navItem = document.createElement('a');
      navItem.className = 'blog-topic my-2 d-flex align-items-center border-top';
      navItem.dataset.scroll = `#description-heading1-scroll${key}`;
      navItem.setAttribute('role', 'button');
      navItem.innerHTML = `
        <div class="blog-list-bullet align-self-center me-2"></div>
        ${element.innerText}
      `;
      navigationContainer.appendChild(navItem);
    }
  });

  // Smooth scrolling on click
  document.querySelectorAll('#description-heading1 a').forEach(link => {
    link.addEventListener('click', function (event) {
      event.preventDefault();
      const target = document.querySelector(this.dataset.scroll);
      const targetPosition = target.offsetTop - 150;
      window.scrollTo({
        top: targetPosition,
        behavior: 'smooth'
      });
    });
  });

  // Active state detection
  window.addEventListener('scroll', function () {
    const scrollPosition = window.scrollY + 160;
    let activeElement = null;

    headings.forEach((element, key) => {
      const marker = document.querySelector(`#description-heading1-scroll${key}`);
      if (marker.offsetTop <= scrollPosition) {
        activeElement = key;
      }
    });

    // Toggle active state
    document.querySelectorAll('#description-heading1 a.blog-topic').forEach((element, key) => {
      element.classList.toggle('active', key === activeElement);
    });
  });

  // Sticky position adjustment
  window.addEventListener('scroll', function () {
    const stickyElements = document.querySelectorAll('.position-sticky');
    stickyElements.forEach(element => {
      element.style.top = window.scrollY > 100 ? '85px' : '386px';
    });
  });
});