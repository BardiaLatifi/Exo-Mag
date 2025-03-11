<!-- HTML -->
<div class="sticky-margin-top align-self-start bg-light p-3 mb-3">
  <!-- Flex container for header and toggle button (with no extra space between) -->
  <div class="header-container">
    <button type="button" id="toggleDropdown" class="toggle-button">
      <i class="fa fa-angle-down"></i>
    </button>
    <h5 class="fw-bold mb-2">فهرست مطالب</h5>
  </div>
  <div id="description-heading1" class="d-inline-flex flex-column ms-3"></div>
</div>

<style>
  .sticky-margin-top {
    position: sticky;
    top: 85px;
    transition: top 0.5s;
    user-select: none;
    font-size: 0.8rem;
  }
  /* Flex container for header and toggle button (row direction, no extra space) */
  .header-container {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  /* Styling for the toggle button */
  .toggle-button {
    align-self: start;
    width: 25px;
    height: 25px;
    background: transparent;
    margin-left: 10px;
    font-size: 1.2rem;
    font-weight: bold;
    color: #03C03C;
    border: 1px solid #03C03C;
    border-radius: 5px;
    cursor: pointer;
  }
  .toggle-button i {
    transform: translateY(-2px);
  }
  .toggle-button:hover {
    background-color : #03C03C;
    color: white;
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
      $('#description-heading1').append(
        '<a class="mb-1 ms-2 d-flex align-items-center" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
          '<div style="width:11px; height:11px; background-color:transparent; border:1px solid #03C03C; border-radius:4px; margin-left:8px; align-self:center;"></div>' +
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

  // Determine the current section index based on scroll position
  $('.description h3').each(function (key) {
    const target = $('#description-heading1-scroll' + key);
    if (target.offset().top <= scrollPosition) {
      currentIndex = key;
    }
  });

  // Update bullets: only the bullet for the current section is highlighted
  $('.description h3').each(function (key) {
    const bullet = $('#description-heading1 a').eq(key).find('div');
    if (key === currentIndex) {
      bullet.css('background-color', '#03C03C');
    } else {
      bullet.css('background-color', 'transparent');
    }
  });
});

$(document).ready(function() {
  // Filter out the h3 anchors (assumed not to contain a <b> tag) inside #description-heading1
  const h3Anchors = $('#description-heading1 a').filter(function() {
    return $(this).find('b').length === 0;
  });
  
  // Wrap all h3 anchors in a dropdown container, hidden by default.
  if (h3Anchors.length > 0) {
    h3Anchors.wrapAll('<div id="h3Dropdown" style="display:none;"></div>');
  }
  
  // Toggle the dropdown container on button click and update the icon.
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
});
</script>
