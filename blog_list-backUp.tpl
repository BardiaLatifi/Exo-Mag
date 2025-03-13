<!-- Main container with sticky positioning -->
<div class="position-sticky w-100 user-select-none rounded align-self-start bg-light p-3" style="top: 386px; font-size: 0.8rem; transition: top 0.5s;">
  <div class="header-container d-flex flex-row align-items-center mb-2">
    <button class="blog-dropdown-button btn btn-outline-success p-0 me-2 fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#description-heading1" aria-expanded="true" aria-controls="description-heading1" style="width: 22px; height: 22px;">
      <i class="fa fa-angle-down" style="transition: transform 0.2s ease"></i>
    </button>
    <h5 class="fw-bold mb-2 h6">فهرست مطالب</h5>
  </div>
  <div class="collapse show" id="description-heading1">
    <div class="d-inline-flex flex-column ms-3"></div>
  </div>
</div>

<style>
  .blog-dropdown-button:hover {
    background-color: #03C03C;
    color: white !important;
    transition: 200ms;
  }
  
  .blog-dropdown-button[aria-expanded="true"] i {
    transform: rotate(180deg);
  }

  #description-heading1 a {
    font-weight: normal;
  }

  #description-heading1 a.active {
    font-weight: bold;
  }

  #description-heading1 a.active .blog-list-bullet {
    background-color: #03C03C;
  }

  /* Prevent bullet shrinking */
  .blog-list-bullet {
    width: 11px;
    height: 11px;
    border: 1px solid #03C03C;
    border-radius: 4px;
    flex-shrink: 0;
  }
</style>

<script>
$(document).ready(function() {
  // Generate navigation items from h2 and h3
  $('.description h2, .description h3').each(function (key, element) {
    $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
    
    if (element.innerText.trim()) {
      $('#description-heading1 .d-inline-flex').append(
        '<a class="blog-topic my-2 d-flex align-items-center border-top" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<div class="blog-list-bullet align-self-center me-2"></div>' +
          element.innerText +
        '</a>'
      );
    }
  });

  // Smooth scrolling on click
  $('#description-heading1 a').on('click', function () {
    $('html, body').animate({ scrollTop: $($(this).data('scroll')).offset().top - 150 }, 100);
  });

  // Active state detection
  $(window).on('scroll', function () {
    const scrollPosition = $(window).scrollTop() + 160;
    let activeElement = null;

    $('.description h2, .description h3').each(function (key, element) {
      if ($('#description-heading1-scroll' + key).offset().top <= scrollPosition) {
        activeElement = key;
      }
    });

    // Toggle active state
    $('#description-heading1 a.blog-topic').each(function (key, element) {
      $(element).toggleClass('active', key === activeElement);
    });
  });

  // Sticky position adjustment
  $(window).on('scroll', function () {
    $('.position-sticky').css('top', $(window).scrollTop() > 100 ? '85px' : '386px');
  });
});
</script>