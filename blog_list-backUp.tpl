<div class="sticky-margin-top align-self-start pt-3 ps-3 mb-3">
  <div class="header-container">
    <button type="button" id="toggleDropdown" class="blog-toggle-button">
      <i class="fa fa-angle-down"></i>
    </button>
    <h5 class="fw-bold mb-2 h6">فهرست مطالب</h5>
  </div>
  <div id="description-heading1" class="d-inline-flex flex-column ms-3"></div>
</div>

<style>
  .sticky-margin-top {
    position: sticky;
    top: 386px;
    transition: top 0.5s;
    user-select: none;
    font-size: 0.8rem;
    background-color: rgba(245, 245, 247, 0.5);
    border-radius: 5px;
  }
  /* Flex container for toggle button and header */
  .header-container {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  /* Styling for the toggle button */
  .blog-toggle-button {
    align-self: start;
    width: 22px;
    height: 22px;
    background: transparent;
    margin-left: 10px;
    font-size: 1.2rem;
    font-weight: bold;
    color: #03C03C;
    border: 1px solid #03C03C;
    border-radius: 5px;
    cursor: pointer;
    transition: 200ms;
  }
  .blog-toggle-button i {
    transform: translateY(-3px);
  }
  .blog-toggle-button:hover {
    background-color: #03C03C;
    color: white;
    transition: 200ms;
  }
  /* Styling for the bullets */
  .blog-list-bullet {
    width: 11px;
    height: 11px;
    background-color: transparent;
    border: 1px solid #03C03C;
    border-radius: 4px;
    margin-left: 8px;
    align-self: center;
  }

  .blog-topic {
    border-top: 1px solid #E6E6E6;
    padding: 1em 0;
    font-weight: normal;
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
        '<a class="blog-topic mb-1 ms-2 d-flex align-items-center" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<div class="blog-list-bullet"></div>' +
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
  
  // Toggle the dropdown button icon.
  $('#toggleDropdown').on('click', function() {
    $('#h3Dropdown').slideToggle(200, function() {
      const icon = $('#toggleDropdown i');
      if ($('#h3Dropdown').is(':visible')) {
        icon.removeClass('fa-angle-down').addClass('fa-angle-up');
      } else {
        icon.removeClass('fa-angle-up').addClass('fa-angle-down');
      }
    });
  });
  // Dynamic sticky container
  $(window).on('scroll', function() {
    const scrollTop = $(window).scrollTop();
    // 100px threshold
    if (scrollTop > 100) {
      $('.sticky-margin-top').css('top', '85px');
    } else {
      $('.sticky-margin-top').css('top', '386px');
    }
  });
});
</script>
