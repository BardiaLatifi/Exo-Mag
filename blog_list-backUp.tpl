<div class="sticky-top align-self-start bg-light p-3 mb-3">
	<h5 class="fw-bold mb-2">فهرست مطالب</h5>
	<div id="description-heading1" class="d-inline-flex flex-column ms-3"></div>
</div>
<script>
$('.description h2, .description h3').each(function (key, element)  {
  $(element).after('<div id="description-heading1-scroll' + key + '"></div>');
  if (element.innerText.trim()) {
    if (element.tagName == 'H2') {
	  $('#description-heading1').append('<a class="my-2" data-scroll="#description-heading1-scroll' + key + '" role="button"><b>' + element.innerText + '</b></a>')
    } else {
	  $('#description-heading1').append('<a class="mb-1 ms-2" data-scroll="#description-heading1-scroll' + key + '" role="button">- ' + element.innerText + '</a>')
    }
  }
});

$('#description-heading1 a').on('click' , function () {
  $('html, body').animate({scrollTop: $($(this).data('scroll')).offset().top-150}, 100);
})
</script>