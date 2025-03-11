<div class="sticky-margin-top align-self-start bg-light p-3 mb-3">
	<h5 class="fw-bold mb-2">فهرست مطالب</h5>
	<div id="description-heading1" class="d-inline-flex flex-column ms-3"></div>
</div>
<style> 
  
  .sticky-margin-top{
    position: sticky;
    top: 85px;
    transition: top 0.5s;
    user-select: none;
    font-size: 0.8rem;
  }
</style>

<script>
$('.description h2, .description h3').each(function (key, element)  {
  $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
  if (element.innerText.trim()) {
    if (element.tagName == 'H2') {
      $('#description-heading1').append('<a class="my-2" data-scroll="#description-heading1-scroll' + key + '" role="button"><b>' + element.innerText + '</b></a>')
    } else {
      $('#description-heading1').append(
        '<a class="mb-1 ms-2 d-flex align-items-center" data-scroll="#description-heading1-scroll' + key + '" role="button">' +
        '<div style="width:14px; height:14px; background-color:transparent; border:1px solid #03C03C; border-radius:5px; margin-left:8px; align-self:center;"></div>' +
        element.innerText +
        '</a>'
      )
    }
  }
});

$('#description-heading1 a').on('click' , function () {
  $('html, body').animate({scrollTop: $($(this).data('scroll')).offset().top-150}, 100);
});

// Change active state detection to current state detection
$(window).scroll(function() {
  const scrollPosition = $(window).scrollTop() + 160;
  let currentIndex = -1;
  
  // Determine the current section index based on scroll position
  $('.description h3').each(function(key) {
    const target = $('#description-heading1-scroll' + key);
    if (target.offset().top <= scrollPosition) {
      currentIndex = key;
    }
  });
  
  // Update bullets: only the bullet for the current section is highlighted
  $('.description h3').each(function(key) {
    const bullet = $('#description-heading1 a').eq(key).find('div');
    if (key === currentIndex) {
      bullet.css('background-color', '#03C03C');
    } else {
      bullet.css('background-color', 'transparent');
    }
  });
});
</script>
