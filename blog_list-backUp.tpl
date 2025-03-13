<div class="position-sticky w-100 user-select-none rounded align-self-start bg-light pt-3 ps-3 mb-3" style="top: 386px; font-size: 0.8rem; transition: top 0.5s;">
  <div class="header-container d-flex flex-row align-items-center mb-2">
  <input type="checkbox" id="blog-dropdown-input" class="blog-dropdown-input d-none">
  <label for="blog-dropdown-input" id="blog-dropdown-button" class="btn d-flex rounded align-items-center justify-content-center p-0 me-2 fs-6" style="width: 22px; height: 22px; color: #03C03C; border-color: #03C03C;">
      <i class="fa fa-angle-down" style="transition: transform 0.2s ease"></i>
    </label>
    <h5 class="fw-bold mb-2 h6">فهرست مطالب</h5>
  </div>
  <div id="description-heading1" class="d-inline-flex flex-column ms-3"></div>
</div>

<style>
  #blog-dropdown-button:hover {
    background-color: #03C03C;
    color: white !important;
    transition: 200ms;
  }

  .blog-dropdown-input:checked + #blog-dropdown-button i {
    transform: rotate(180deg);
  }
</style>

<script>
$('.description h2, .description h3').each(function (key, element) {
  $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
  if (element.innerText.trim()) {
    if (element.tagName === 'H2') {
      $('#description-heading1').append(
        '<a class="my-2" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<b>' + element.innerText + '</b>' +
        '</a>'
      );
    } else {
      // For h3: add an anchor with the "blog-topic" class
      $('#description-heading1').append(
        '<a class="blog-topic mb-1 d-flex align-items-center border-top pt-3 pb-3" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<div class="blog-list-bullet bt-transparent align-self-center me-2" style="width:11px; height:11px; border:1px solid #03C03C; border-radius:4px;"></div>' +
          element.innerText +
        '</a>'
      );
    }
  }
});

$('#description-heading1 a').on('click', function () {
  $('html, body').animate({ scrollTop: $($(this).data('scroll')).offset().top - 150 }, 100);
});

// Change active state detection to current state detection
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
  
  // Select only h3 anchors (blog-topic) from the navigation
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

$(document).ready(function() {
  // Filter out the h3 anchors (assumed not to contain a <b> tag) inside #description-heading1
  const blogTopics = $('#description-heading1 a').filter(function() {
    return $(this).hasClass('blog-topic');
  });
  
  // Dropdown hidden by default
  if (blogTopics.length > 0) {
    blogTopics.wrapAll('<div id="h3Dropdown" style="display:none;"></div>');
  }
  
  // Add this to handle the toggle since CSS selector can't reach nested element easily
  $('#blog-dropdown-input').on('change', function() {
    if($(this).is(':checked')) {
      $('#h3Dropdown').slideDown(200);
    } else {
      $('#h3Dropdown').slideUp(200);
    }
  });
  
  // Dynamic sticky container
  $(window).on('scroll', function() {
    const scrollTop = $(window).scrollTop();
    // 100px threshold
    if (scrollTop > 100) {
      $('.position-sticky').css('top', '85px');
    } else {
      $('.position-sticky').css('top', '386px');
    }
  });
});
</script>