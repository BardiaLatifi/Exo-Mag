<!-- Main container with sticky positioning -->
<div class="position-sticky w-100 user-select-none rounded align-self-start bg-light p-3" style="top: 386px; font-size: 0.8rem; transition: top 0.5s;">
  <div class="header-container d-flex flex-row align-items-center mb-2">
    <!-- Collapse Toggle Button -->
    <button class="blog-dropdown-button btn btn-outline-success p-0 me-2 fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#description-heading1" aria-expanded="true" aria-controls="description-heading1" style="width: 22px; height: 22px;">
      <i class="fa fa-angle-down" style="transition: transform 0.2s ease"></i>
    </button>
    <h5 class="fw-bold mb-2 h6">فهرست مطالب</h5>
  </div>
  <!-- Collapse Content Container (expanded by default with "show" class) -->
  <div class="collapse show" id="description-heading1">
    <!-- Inner container for dynamic items -->
    <div class="d-inline-flex flex-column ms-3">
      <!-- Dynamic items will be appended here -->
    </div>
  </div>
</div>

<style>
  /* Button hover effect */
  .blog-dropdown-button:hover {
    background-color: #03C03C;
    color: white !important;
    transition: 200ms;
  }
  
  /* Rotate the custom icon when the collapse is open */
  .blog-dropdown-button[aria-expanded="true"] i {
    transform: rotate(180deg);
  }

  /* Default text style (normal) */
  #description-heading1 a {
    font-weight: normal;
  }

  /* Active state (bold text and filled bullet) */
  #description-heading1 a.active {
    font-weight: bold;
  }

  #description-heading1 a.active .blog-list-bullet {
    background-color: #03C03C;
  }
</style>

<script>
// Dynamically generate navigation items from both h2 and h3 elements
$('.description h2, .description h3').each(function (key, element) {
  // Insert a marker element after each header for scrolling purposes
  $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
  
  if (element.innerText.trim()) {
    // For both h2 and h3, include a bullet element and add the common class "blog-topic"
    $('#description-heading1 .d-inline-flex').append(
      '<a class="blog-topic my-2 d-flex align-items-center border-top" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
        '<div class="blog-list-bullet bt-transparent align-self-center me-2" ' +
             'style="width:11px; height:11px; border:1px solid #03C03C; border-radius:4px; flex-shrink: 0;"></div>' +
        element.innerText +
      '</a>'
    );
  }
});

// Smooth scroll when an item is clicked
$('#description-heading1 a').on('click', function () {
  $('html, body').animate({ scrollTop: $($(this).data('scroll')).offset().top - 150 }, 100);
});

// Active state detection for both h2 and h3
$(window).scroll(function () {
  const scrollPosition = $(window).scrollTop() + 160;
  let currentIndex = -1;
  
  // Loop through both h2 and h3 headers to determine the current section index
  $('.description h2, .description h3').each(function (key, element) {
    const target = $('#description-heading1-scroll' + key);
    if (target.offset().top <= scrollPosition) {
      currentIndex = key;
    }
  });
  
  // Apply active styles to the corresponding navigation item (both h2 and h3 have class blog-topic)
  $('#description-heading1 a.blog-topic').each(function (key, element) {
    if (key === currentIndex) {
      $(element).addClass('active'); // Apply bold text and filled bullet
    } else {
      $(element).removeClass('active'); // Reset to normal text and empty bullet
    }
  });
});

// Dynamic sticky container adjustment based on scroll position
$(window).on('scroll', function () {
  const scrollTop = $(window).scrollTop();
  if (scrollTop > 100) {
    $('.position-sticky').css('top', '85px');
  } else {
    $('.position-sticky').css('top', '386px');
  }
});
</script>
