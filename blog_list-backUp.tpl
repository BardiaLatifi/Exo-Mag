<!-- Main container with sticky positioning -->
<div class="position-sticky w-100 user-select-none rounded align-self-start bg-light pt-3 ps-3 mb-3" style="top: 386px; font-size: 0.8rem; transition: top 0.5s;">
  <div class="header-container d-flex flex-row align-items-center mb-2 pb-2">
    <!-- Collapse Toggle Button -->
    <button class="blog-dropdown-button btn btn-outline-success p-0 me-2 fs-6" type="button" data-bs-toggle="collapse" data-bs-target="#description-heading1" aria-expanded="false" aria-controls="description-heading1" style="width: 22px; height: 22px;">
      <i class="fa fa-angle-down" style="transition: transform 0.2s ease"></i>
    </button>
    <h5 class="fw-bold mb-2 h6">فهرست مطالب</h5>
  </div>
  <!-- Collapse Content Container -->
  <div class="collapse" id="description-heading1">
    <!-- Inner container for dynamic items -->
    <div class="d-inline-flex flex-column ms-3">
      <!-- Dynamic items will be appended here -->
    </div>
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
</style>

<script>
// Dynamically generate the expand/collapse items from .description headers
$('.description h2, .description h3').each(function (key, element) {
  // Insert a marker element after each header for scrolling purposes
  $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
  
  if (element.innerText.trim()) {
    if (element.tagName === 'H2') {
      // Append H2 items as bold links
      $('#description-heading1 .d-inline-flex').append(
        '<a class="my-2" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<b>' + element.innerText + '</b>' +
        '</a>'
      );
    } else {
      // Append H3 items with additional styling (blog-topic)
      $('#description-heading1 .d-inline-flex').append(
        '<a class="blog-topic mb-1 d-flex align-items-center border-top pt-3 pb-3" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<div class="blog-list-bullet bt-transparent align-self-center me-2" style="width:11px; height:11px; border:1px solid #03C03C; border-radius:4px;"></div>' +
          element.innerText +
        '</a>'
      );
    }
  }
});

// Smooth scroll on item click
$('#description-heading1 a').on('click', function () {
  $('html, body').animate({ scrollTop: $($(this).data('scroll')).offset().top - 150 }, 100);
});

// Active state detection for h3 items during scroll
$(window).scroll(function () {
  const scrollPosition = $(window).scrollTop() + 160;
  let currentIndex = -1;
  
  // Determine the current section index among h3 elements
  $('.description h3').each(function (key, element) {
    const target = $('#description-heading1-scroll' + key);
    if (target.offset().top <= scrollPosition) {
      currentIndex = key;
    }
  });
  
  // Apply active styles to blog-topic links
  const blogTopics = $('#description-heading1 a').filter(function() {
    return $(this).hasClass('blog-topic');
  });
  
  blogTopics.each(function(key, element) {
    if (key === currentIndex) {
      $(element).css('font-weight', 'bold');
      $(element).find('div').css('background-color', '#03C03C');
    } else {
      $(element).css('font-weight', 'normal');
      $(element).find('div').css('background-color', 'transparent');
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