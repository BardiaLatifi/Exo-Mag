<?php echo $header; ?>
<?php echo $schema; ?>

<?php if ($is_mobile) { ?>
	<?php if ($breadcrumbs) { ?>
	<div class="pb-2 mb-3">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php  if (count($breadcrumbs) > $key + 1) { ?>
		<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php  if (count($breadcrumbs) > $key + 2) { ?> <i class="fa fa-angle-left"></i><?php } ?>
		<?php } ?>
		<?php } ?>
	</div>
	<?php } ?>
    <div class="row mx-auto">
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-md-9 col-sm-8'; ?>
        <?php } else { ?>
            <?php $class = 'col-12'; ?>
        <?php } ?>
        <?php echo $content_top; ?>

        <div class="<?php echo $class; ?> p-0" itemscope itemtype="https://schema.org/BlogPosting">
            <img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" class="w-100 mw-100" itemprop="image">
            <div class="p-4 rounded-2 mt-n2 position-relative">
                <?php if ($edit) { ?><a href="<?php echo $edit; ?>" target="_blank" class="ms-auto mb-3 badge bg-secondary"><i class="fa fa-pencil fa-2x"></i></a><?php } ?>
                <!-- the title. border bottom removed -->
                <h1 class="h2 fw-bold pb-3 lh-base text-center" itemprop="headline"><?php echo $heading_title; ?></h1>
                <!-- The Author Container, flex-column removed, Avatar width changed from 60px to 45px -->
                <div class="fw-normal d-flex align-items-center gap-2 mt-3 ps-2 font-yekan text-black">
                    <div class="d-flex align-items-center">
                        <img src="catalog/view/theme/default/image/avatar.jpg" alt="avatar" class="rounded-circle me-2" width="35">
                        <a href="<?php echo $user_info; ?>" class="border-end py-1 border-1 pe-2 text-decoration-none" style="border-color: #03C03C !important" itemprop="author" itemscope itemtype="https://schema.org/Person">
                            نوشته‌ی <span itemprop="name"><?php echo $author; ?></span>
                        </a>
                    </div>
                    <div class="border-end py-1 border-1 pe-2" style="border-color: #03C03C !important">
                        <?php echo $date_time_diff; ?>
                        <meta content="<?php echo $date_added; ?>" itemprop="datePublished">
                    </div>
                    <div>زمان مطالعه: <?php echo $text_read_time; ?></div>
                </div>

                <?php if($post_author_status && false){ ?>
                <p class="p-top-post">
                    <img src="<?php echo $author_avatar; ?>" alt="<?php echo $author; ?>">
                    <?php if ($edit) { ?><a href="<?php echo $edit; ?>" target="_blank"><i class="icon-pencil pencil-post"></i></a><?php } ?>
                    <a href="<?php echo $user_info; ?>" target="_blank"><?php echo $author; ?></a>
                    <?php } ?>

                    <?php if($post_date_added_status  && false) { ?><span class="left-span-post"> <?php echo $date_time_diff; ?> <i class="icon-clock"></i><?php } ?></span></p>
                <!--  BLOG_LIST. d-flex, flex-row, button and the i tag copied from blog_list file -->
                <div class="position-sticky bg-light mb-3" style="top: 55px; overflow: visible">
                    <div class="d-flex align-items-center p-2">
                    <button id="mobile-toc-button" class="btn p-0 me-3" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#mobile-blog-list" aria-expanded="false"
                            style="width: 25px; height: 25px; background:#03C03C">
                        <i class="fa fa-angle-down fs-4 fw-bolder" style="color:white"></i>
                    </button>
                        <h5 class="fw-bold mb-0">فهرست مطالب</h5>
                    </div>

                    <div id="mobile-blog-list" class="border-2 border-top collapse">
                        <div class="d-flex flex-nowrap overflow-auto px-2 pb-2" 
                            style="position: sticky; touch-action: pan-x; scrollbar-width: none">
                        </div>
                    </div>
                </div>
                <div class="description fw-normal mt-4 text-justify overflow-hidden" itemprop="articleBody">
                    <?php echo $description; ?>
                </div>

                    <!-- 
                        New design - Like and Comment
                    -->
                    <div class="w-100 text-center my-5">
                        <img  src="catalog/view/theme/default/image/gray-logo.png" alt="logo">
                    </div>


                <!-- The Tags -->

                <?php if ($tags) { ?>
                    <div class="d-flex my-4 fw-normal">
                        <span class="fw-bold flex-shrink-0 me-2"><?php echo $text_tags; ?></span>
                        <div>
						<?php for ($i = 0; $i < count($tags); $i++) { ?>
						<?php if ($i < (count($tags) - 1)) { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"
							   class="badge bg-light fw-normal text-dark text-wrap"><?php echo $tags[$i]['tag']; ?></a>
						<?php } else { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"
							   class="badge bg-light fw-normal text-dark text-wrap"><?php echo $tags[$i]['tag']; ?></a>
						<?php } ?>
						<?php } ?>
                        </div>
                    </div>
                <?php } ?>
				
				 <?php if (false) { ?>
                <div class="d-flex flex-row align-items-center justify-content-between ">
                    <h3 class="fs-6 fw-bold">این نوشته را دوست داشتید؟</h3>
                    <div class="d-flex gap-5">
                        <i class="fas fa-comment"></i>
                        <i class="fa-solid fa-heart"></i>
                    </div>
                </div>

                <!-- New Design FAQ -->

                <div class="w-100 border-top my-5 py-3">
                <h3 class="fs-5 fw-bold">سوالات متداول</h3>
                </div>


                <!-- New Design Related Articles -->

                <div class="w-100 border-top my-5 py-3">
                <h3 class="fs-5 fw-bold">مقالات مرتبط</h3>
                <div class="d-flex flex-column p-3">
                    <div class="d-flex flex-row gap-3">
                        <i class="fas fa-bars"></i>
                        <p>title</p>
                    </div>
                    <div class="d-flex flex-row gap-3">
                        <i class="fas fa-bars"></i>
                        <p>title</p>
                    </div>
                    <div class="d-flex flex-row gap-3">
                        <i class="fas fa-bars"></i>
                        <p>title</p>
                    </div>
                </div>
                </div>

                <!-- New Design The Latest Articles -->

                <div class="w-100 text-white text-center p-4" style="background: rgba(3, 192, 60, 1);">
                    <p class="m-0 fs-5">آخرین مقالات</p>
                </div>
                <!-- Deep Seek OutPut -->
				<?php } ?>
                <?php if ($blogs) { ?>
                    <div class="d-flex flex-column gap-4 mt-4">
                        <?php $count = 0; ?>
                        <?php foreach ($blogs as $blog) { ?>
                            <?php if ($count++ >= 3) break; ?>
                            <a href="<?php echo $blog['href']; ?>" target="_blank" class="d-block rounded overflow-hidden text-decoration-none text-dark">
                                <div class="row border-bottom border-light border-2 py-3">
                                    <div class="col-8">
                                        <div class="d-flex flex-column p-3 h-100">
                                            <small class="text-light lh-5 fs-6 mb-3"><?php echo $blog['author']; ?></small>
                                            <h3 class="text-muted lh-5 fs-5 mb-2"><?php echo $blog['title']; ?></h3>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center col-4">
                                        <img class="w-100 rounded object-fit-cover" src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>">
                                    </div>
                                </div>
                            </a>    
                        <?php } ?>
                    </div>
                <?php } ?>

                <div class="d-none">
                    <?php if ($customer_liked) { ?>
                        <i class="fa fa-heart liked"></i>
                    <?php } else { ?>
                        <i class="fa fa-heart-o like"></i>
                    <?php } ?>
                    <span id="count-liked"><?php echo $count_liked; ?></span> نفر این پست را پسندیده اند. <span class="bold-txt"><?php echo $text_share_this;?></span>
                </div> 
                <div class="d-flex justify-content-between pb-4 border-bottom border-light py-1 border-1 mb-4">
                    <div>
                        <h6 class="fw-bold mb-3">به اشتراک بگذارید در :</h6>
                        <a href="https://telegram.me/share/url?url=<?php echo $blog_url; ?>&amp;text=<?php echo $heading_title; ?>" class="ms-3" target="_blank"><i class="fa fa-paper-plane fa-2x text-light align-middle"></i></a>
                        <a href="http://twitter.com/intent/tweet/?text=<?php echo $heading_title; ?>&amp;url=<?php echo $blog_url; ?>" class="ms-3" target="_blank"><i class="fa fa-twitter fa-2x text-light align-middle"></i></a>
                    </div>
                    <div>
                        <div id="rate">
                            <div class="d-flex justify-content-end align-items-center fixed-rate text-end position-relative">
                                <span class="fs-3 text-secondary me-2"><?php echo round($rate, 2); ?></span>
                                <i class="icon-font fs-3" style="--i:<?php echo $rate * 20; ?>%"></i>
                            </div>
                        </div>
                        <div id="customer-rate">
                            <?php if ($customer_rate) { ?>
                            <div class="d-flex justify-content-end align-items-center fixed-rate text-end position-relative">
                                <span class="fs-5 text-secondary mx-2"><?php echo round($customer_rate, 2); ?></span>
                                <i class="icon-font fs-3" style="--i:<?php echo $customer_rate * 20; ?>%"></i>
                            </div>
                            <?php } else { ?>
                            <div class="d-flex justify-content-end align-items-center rate text-end position-relative">
                                <input type="text" name="rate" class="fs-5 text-secondary align-top border-0" size="1" width="1" readonly style="outline:none">
                                <i class="icon-font"></i>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php if ($blogs && false) { ?>
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="head-title">
                            <div class="line-dark-gray"></div>
                            <div class="txt-line"><h3>مطالب مشابه</h3></div>
                            <div class="txt-line txt-line-two"><a href="<?php echo $blogs_more; ?>" target="_blank">مشاهده موارد بیشتر</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="two-main-carousel">
            <div class="owl-carousel more-owl-carousel">
                <?php foreach ($blogs as $blog) { ?>
                    <div class="main-option">
                        <a href="<?php echo $blog['href']; ?>" target="_blank"><img class="top-img" src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>"></a>
                        <div class="txt-main-option">
                            <a href="<?php echo $blog['href']; ?>" target="_blank"><h4><?php echo $blog['title']; ?></h4></a>
                            <span class="txt-main-option-span"><?php echo $blog['author']; ?></span>
                            <ul class="owl-ul">
                                <li><a><i class="img-icon icon-comment"></i><?php echo $blog['comment_total']; ?></a></li>
                                <li><a><i class="img-icon icon-heart"></i><?php echo $blog['count_liked']; ?></a></li>
                            </ul>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    <?php } ?>

    <!-- New Design Related Products -->

    <?php if ($product_related) { ?>
            <h4 class="fw-bold m-4">محصولات مرتبط</h4>
        </div>
        <div id="related-products" class="owl-carousel ps-4 mt-2" style="background:rgba(230, 248, 232, 1);">
		  <?php foreach ($product_related as $product) { ?>
            <a href="<?php echo $product['href']; ?>" class="d-flex flex-column h-100 bg-white text-center border rounded-2 overflow-hidden p-3">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-fluid">
                <small class="d-block fw-bold text-dark text-truncate my-2 font-latin-yekan"><?php echo $product['name']; ?></small>
                <?php if (!$product['special']) { ?>
                    <h6 class="text-success mt-auto"><?php echo $product['price']; ?></h6>
                <?php } else { ?>
                    <div class="fw-normal d-flex flex-wrap justify-content-center">
                        <del class="text-danger"><?php echo $product['price']; ?></del>
                        <span class="text-success"><?php echo $product['special']; ?></span>
                    </div>
                <?php } ?>
            </a>
		  <?php } ?>
        </div>
        <script>
            $('#related-products').owlCarousel({
                items:2.5,rtl:true,nav:false,dots:false,loop:true,margin:12,stagePadding:3,autoplay:true,
                responsive:{576:{items:3.5},768:{items:4.5},992:{items:5.5}}
            })
        </script>
    <?php } ?>

    <!-- New design suggested Articles -->

    <h5 class="m-4 fw-bold">مقالات پیشنهادی</h5>

    <?php if ($blogs) { ?>
                <div id="related-posts" class="owl-carousel mt-4 ps-3">
                    <?php foreach ($blogs as $blog) { ?>
                        <a href="<?php echo $blog['href']; ?>" target="_blank" class="d-block rounded overflow-hidden border text-center">
                            <img class="top-img" src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>">
                            <div class="d-flex flex-column p-2">
                                <h6 class="text-dark text-truncate my-3 latin-yekan"><?php echo $blog['title']; ?></h6>

                                <div class="d-flex flex-row justify-content-between text-secondary fw-normal align-items-center" style="font-size: 0.8rem !important">
                                    <div class="d-flex flex-row my-2 mx-1">
                                        <img src="catalog/view/theme/default/image/avatar.jpg" alt="avatar" class="rounded-circle me-3" style="width: 25px;">
                                        <small class=" align-self-center"><?php echo $blog['author']; ?></small>
                                    </div>

                                    <div>
                                        <?php echo $date_time_diff; ?>
                                        <meta content="<?php echo $date_added; ?>" itemprop="datePublished">
                                    </div>
                                </div>
                            </div>
                        </a>
                    <?php } ?>
                </div>
                <script>
                    $('#related-posts').owlCarousel({
                        items:1.5,rtl:true,nav:false,dots:false,loop:true,margin:36,autoplay:true
                    })
                </script>
            <?php } ?>


<!-- Comments -->

    <h4 class="fw-bold m-4">نظرات</h4>
    <div class="container-xl px-4 mt-3">
        <div id="comment" class="bg-white px-3 py-1 rounded-2 shadow-sm"></div>
        <?php if(!$allow_comment) { ?>
            <h6 class="bg-white text-dark rounded-2 shadow-sm p-3 text-center fw-bold mt-3"> برای ارسال دیدگاه ابتدا باید<a href="javascript:$('#login-form').modal('show');" class="text-success"> وارد شوید.</a></h6>
        <?php } ?>
        <?php //if($allow_comment && $is_logged) { ?>
        <?php if($allow_comment) { ?>
            <form class="text-end my-4" id="comment-form">
				<input type="text" name="name" value="" id="input-name" placeholder="نام شما" class="form-control" />
                <textarea name="comment" class="bg-white p-3 shadow-sm rounded-2 w-100 border-0" placeholder="دیدگاه خود را اینجا بنویسید" rows="10"></textarea>
                <?php echo $site_key; ?>
                <button type="button" id="button-comment" class="btn btn-success rounded-2 mt-2"><?php echo $text_write_comment; ?></button>
            </form>
        <?php } ?>

    </div>

    <script>
$(document).ready(function() {
    $('.description h2, .description h3').each(function(key, element) {
        const markerId = `mobile-scroll-marker-${key}`;
        $(element).after(`<div id="${markerId}"></div>`);
        
        if ($(element).text().trim()) {
            $('#mobile-blog-list > div').append(`
                <a href="#${markerId}" 
                   class="btn border-2 border-end text-nowrap bg-light"
                   style="border:0; border-radius:0;"
                   data-scroll="${markerId}"
                   role="button">
                    ${$(element).text()}
                </a>
            `);
        }

        $('#mobile-blog-list').on('show.bs.collapse', function() {
            $('#mobile-toc-button i').addClass('rotate-180');
        }).on('hide.bs.collapse', function() {
            $('#mobile-toc-button i').removeClass('rotate-180');
        });
    });

    $('#mobile-blog-list').on('click', 'a', function(e) {
        e.preventDefault();
        const marker = $(this).data('scroll');
        const offset = 100;
        
    
        // Remove active class from all links
        $('#mobile-blog-list a').removeClass('active');
        // Add active class to clicked link
        $(this).addClass('active');

        $('html, body').animate({
            scrollTop: $(`#${marker}`).offset().top - offset
        }, 500);
        
    });
});
</script>
<style>
    .fa-angle-down {
        transition: transform 0.3s ease;
        display: inline-block;
    }
    .rotate-180 {
        transform: rotate(180deg);
    }

    .active {
       background-color: #E6F8E8 !important;
    }
</style>
<?php } else { ?>
    <div class="row container-xxl mx-auto" itemscope itemtype="https://schema.org/BlogPosting">
		<?php if ($breadcrumbs) { ?>
		<div class="pb-2 mb-3">
			<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php  if (count($breadcrumbs) > $key + 1) { ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php  if (count($breadcrumbs) > $key + 2) { ?> <i class="fa fa-angle-left"></i><?php } ?>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
		<?php echo $column_left; ?>
            <!-- img tag moved from here -->
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-12'; ?>
        <?php } ?>
        <?php echo $content_top; ?>

        <div class="<?php echo $class; ?>"> <?php echo $content_top; ?>
            <div class="position-absolute start-75  d-flex flex-column bg-light text-black-50 float-start p-1 mt-3 rounded-1" style="top: 110%">
                <div>
                    <?php if ($customer_liked) { ?>
                    <i class="icon-font icon-heart-fill py-2 text-primary liked" role="button"></i>
                    <?php } else { ?>
                    <i class="icon-font icon-heart-fill py-2 like" role="button"></i>
                    <?php } ?>
                </div>
                <i class="icon-font icon-link py-2" role="button"></i>
            </div>
            <div class="blog-body p-5 rounded-3 rounded-bottom">
                <!-- the h1 tag changed from text-center to text-start, ms-5 added to title, the mx-auto removed from the green line, it changed from col-6 to col-9 -->
                <h1 class="h2 fw-bold font-latin-yekan text-start ms-5" itemprop="headline"><?php echo $heading_title; ?></h1>
                <div class="col-9 mt-4 mb-3" style="background-color:#03c03c;height:3px"></div>
                <!-- The Author Container. content order changed, green border added, avatar width changed from 75 to 60 -->
                <div class="d-flex justify-content-center align-items-center mt-3 mb-4 font-yekan fw-normal">
                    <div class="rounded-circle overflow-hidden me-4">
                        <img src="catalog/view/theme/default/image/avatar.jpg" alt="avatar" width="60">
                    </div>
                    <div class="border-end border-3 me-4 pe-4" style="border-color: #03C03C !important">
                        نوشته‌ی <a href="<?php echo $user_info; ?>" itemprop="author" itemscope itemtype="https://schema.org/Person"><span itemprop="name"><?php echo $author; ?></span></a>
                    </div>
                    <div class="border-end border-3 me-4 pe-4" style="border-color: #03C03C !important">
                        <?php echo $date_time_diff; ?>
                        <meta content="<?php echo $date_added; ?>" itemprop="datePublished">
                    </div>
                    <div class="me-4 pe-4" style="border-color: #03C03C !important">
                        <p class="mb-0" >زمان مطالعه: <?php echo $text_read_time; ?></p>
                    </div>
                    <?php if ($edit) { ?><a href="<?php echo $edit; ?>" target="_blank" class="ms-auto badge bg-secondary"><i class="fa fa-pencil fa-2x"></i></a><?php } ?>

                </div>
                <?php if($post_author_status && false){ ?>
                <p>
                    <img src="<?php echo $author_avatar; ?>" alt="<?php echo $author; ?>">
                    <a href="<?php echo $user_info; ?>" target="_blank"><?php echo $author; ?></a>
                    <?php } ?>

                    <?php if($post_date_added_status  && false) { ?><span class="left-span-post"> <?php echo $date_time_diff; ?> <i class="icon-clock"></i><?php } ?></span>
                </p>

                <div class="row">
                    <div class="description fw-normal font-latin-yekan" itemprop="articleBody">
                        <!-- img tag moved here. border rounded   -->
                        <img class="rounded" src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" itemprop="image">
                        <?php echo $description; ?>
                    </div>
                </div>

                    <!-- 
                        Gray Logo
                    -->
                    <div class="w-100 text-center my-5">
                        <img  src="catalog/view/theme/default/image/gray-logo.png" alt="logo">
                    </div>
<!------------------
TAGS
-------------------->
                    <div>
                        <?php if ($tags) { ?>
                            <div class="mb-4 fw-normal">
                                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                    <?php if ($i < (count($tags) - 1)) { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>" class="badge bg-light text-dark fw-normal me-1"><?php echo $tags[$i]['tag']; ?></a>
                                    <?php } else { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>" class="badge bg-light text-dark fw-normal me-1"><?php echo $tags[$i]['tag']; ?></a>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <?php if (false) { ?>
                        <div>
                            <span class="fw-bold">
                                <svg width="30" height="30" viewBox="0 0 50 50">
                                     <path d="m34.383 8.1507-22.672 16.395 25.764 15.646" style="fill:none;stroke-width:5px;stroke:#333"></path>
                                     <circle cx="34.495" cy="8.1039" r="5" style="fill:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:4;stroke:#093"></circle>
                                     <circle cx="11.978" cy="24.593" r="5.668" style="fill:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:5;stroke:#093"></circle>
                                     <circle cx="37.554" cy="40.238" r="7" style="fill:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:5;stroke:#093"></circle>
                                </svg>
                                به اشتراک بگذارید در :
                            </span>
                            <a href="https://telegram.me/share/url?url=<?php echo $blog_url; ?>&amp;text=<?php echo $heading_title; ?>" target="_blank" class="ms-3"><i class="fa fa-telegram fa-2x text-light align-middle"></i></a>
                            <a href="http://twitter.com/intent/tweet/?text=<?php echo $heading_title; ?>&amp;url=<?php echo $blog_url; ?>" target="_blank" class="ms-3"><i class="fa fa-twitter fa-2x text-light align-middle"></i></a>
                        </div>
                        <?php } ?>
                    </div>

<!-------------------
 the HTML tags of rate part commented out
 -------------------->
                    <div>
						<div id="rate">
							<div class="d-flex justify-content-end align-items-center fixed-rate text-end position-relative">
                                <b class="text-secondary">امتیاز این مطلب: </b>
								<span class="fs-3 text-secondary mx-2"><?php echo round($rate, 2); ?></span>
								<i class="icon-font fs-3" style="--i:<?php echo $rate * 20; ?>%"></i>
							</div>
                        </div> 
						<div id="customer-rate">
							<?php if ($customer_rate) { ?>
							<div class="d-flex justify-content-end align-items-center fixed-rate text-end position-relative">
                                <b class="text-secondary">امتیاز شما: </b>
								<span class="fs-5 text-secondary mx-2"><?php echo round($customer_rate, 2); ?></span>
								<i class="icon-font fs-3" style="--i:<?php echo $customer_rate * 20; ?>%"></i>
							</div>
							<?php } else { ?>
							<div class="d-flex justify-content-end align-items-center rate text-end position-relative">
                                <b class="text-secondary">امتیاز شما: </b>
								<input type="text" name="rate" class="fs-5 text-secondary align-top border-0" size="1" width="1" readonly style="outline:none">
								<i class="icon-font"></i>
							</div>
							<?php } ?>
						</div>
                    </div> 
                </div>
 




				 <?php if (false) { ?>
				<div class="d-flex flex-row align-items-center justify-content-end gap-5 ">
					<h3 class="fs-6 fw-bold">این نوشته را دوست داشتید؟</h3>
						<div class="d-flex gap-5">
							<i class="fas fa-comment"></i>
							<i class="fa-solid fa-heart"></i>
						</div>
				</div>

                <!-- 
                    New design - Related Articles
                 -->
                <h3 class="fs-6 fw-bolder mb-3">مقالات مرتبط</h3>
                 <div class="d-grid" style="grid-template-columns: 80% 20%;">
                    <div class="d-flex flex-column justify-content-between gap-2">
                        <div class="d-flex flex-row gap-3">
                            <i class="fas fa-bars"></i>
                            <p>title</p>
                        </div>
                        <div class="d-flex flex-row gap-3">
                            <i class="fas fa-bars"></i>
                            <p>title</p>
                        </div>
                        <div class="d-flex flex-row gap-3">
                            <i class="fas fa-bars"></i>
                            <p>title</p>
                        </div>
                    </div>
                    
                    <div class="d-flex flex-column justify-content-between gap-2">
                        <p>Date</p>
                        <p>Date</p>
                        <p>Date</p>
                    </div>
                 </div>
				 <?php } ?>

                <!--
                 New Design Suggested Articles
                 -->

            <?php if ($blogs) { ?>
                <h5 class="mt-5 fw-bold">مقالات پیشنهادی</h5>
                <div id="related-posts" class="owl-carousel mt-4">
                    <?php foreach ($blogs as $blog) { ?>
                        <a href="<?php echo $blog['href']; ?>" target="_blank" class="d-block rounded overflow-hidden border text-center">
                            <img class="top-img" src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>">
                            <div class="d-flex flex-column p-2">
                                <h6 class="text-dark text-truncate my-3 latin-yekan"><?php echo $blog['title']; ?></h6>

                                <div class="d-flex flex-row justify-content-between text-secondary fw-normal align-items-center" style="font-size: 0.8rem !important">
                                    <div class="d-flex flex-row">
                                        <img src="catalog/view/theme/default/image/avatar.jpg" alt="avatar" class="rounded-circle me-2" style="width: 30px;">
                                        <small class=" align-self-center"><?php echo $blog['author']; ?></small>
                                    </div>

                                    <div>
                                        <?php echo $date_time_diff; ?>
                                        <meta content="<?php echo $date_added; ?>" itemprop="datePublished">
                                    </div>
                                </div>
                            </div>
                        </a>
                    <?php } ?>
                </div>
                <script>
                    $('#related-posts').owlCarousel({
                        items:3,rtl:true,nav:false,dots:false,loop:true,margin:36,autoplay:true
                    })
                </script>
            <?php } ?>

<!------------------
COMMENT INPUT
-------------------->

             <div class="comments mt-5">
                <div id="comment" class="col-8 mx-auto"></div>
                <?php if(!$allow_comment) { ?>
                    <h6 class="rounded-1 p-3 text-center fw-bold mt-3"> برای ارسال دیدگاه ابتدا باید<a href="javascript:$('#login-form').modal('show');" class="text-success"> وارد شوید.</a></h6>
                <?php } ?>
                <?php //if($allow_comment && $is_logged) { ?>
                <?php if($allow_comment) { ?>
                    <form class="col-8 mx-auto my-4" id="comment-form">
						<input type="text" name="name" value="" id="input-name" placeholder="نام شما" class="bg-light form-control" />
                        <textarea name="comment" placeholder="دیدگاه خود را اینجا بنویسید" class="bg-light rounded-3 p-3 w-100 border-0 mt-3" size="" rows="10"></textarea>
						<?php echo $site_key; ?>
                        <button type="button" id="button-comment" class="btn btn-primary border-0 float-end rounded-1"><?php echo $text_write_comment; ?></button>
                    </form>
                <?php } ?>

            </div>


                <!-- ----------------
                New Design - RELATED PRODUCTS
                ------------------ -->

        <?php if ($product_related) { ?>
            <h5 class="fw-bold mb-5 mt-5">محصولات مرتبط</h5>
            <div class=" rounded px-5 py-3" style="background:#E6F8E8;"> <!-- Added wrapper div with background and vertical padding -->
                <div id="related-products" class="owl-carousel">
                    <?php foreach ($product_related as $product) { ?>
                    <a href="<?php echo $product['href']; ?>" class="d-block text-center bg-white border rounded-1 overflow-hidden p-4">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-fluid">
                        <h6 class="text-dark fw-bold text-truncate my-3 latin-yekan"><?php echo $product['name']; ?></h6>
                        <?php if (!$product['special']) { ?>
                            <h6 class="text-success mb-1"><?php echo $product['price']; ?></h6>
                        <?php } else { ?>
                            <div class="mb-1">
                                <span class="text-success"><?php echo $product['special']; ?></span>
                                <del class="text-danger"><?php echo $product['price']; ?></del>
                            </div>
                        <?php } ?>
                    </a>
                    <?php } ?>
                </div>
                <script>
                    $('#related-products').owlCarousel({
                        items: 3, rtl: true, nav: false, dots: false, loop: true, margin: 36, autoplay: true
                    });
                </script>
            </div>
        <?php } ?>



    <?php echo $content_bottom; ?>
 
            </div><?php echo $column_right; ?>
</div> 
<?php } ?>

<!-------------------
 RATE - STYLE & LOGICS
 ------------------->

 <style>
    #customer-rate i.icon-font::before ,
    #rate i.icon-font::before {
        content: "\0052\0052\0052\0052\0052";
    }
    .fixed-rate i.icon-font {
        background: linear-gradient(90deg, #fe0 var(--i), #ccc var(--i));
        -webkit-text-fill-color: transparent;
        -webkit-background-clip: text;
    }
    .rate i.icon-font {
        background: linear-gradient(90deg, #fe0 50%, #ccc 50%);
        -webkit-text-fill-color: transparent;
        -webkit-background-clip: text;
        cursor: pointer
    }
</style>
<script>
    $('.rate i').on('mousemove', function (params) {
        let rateNumber = params.offsetX * 100 / params.target.clientWidth;
        $(this).css('background', `linear-gradient(90deg,#fe0 ${Math.ceil(rateNumber / 20) * 20}%,#ccc ${Math.ceil(rateNumber / 20) * 20}%)`)
        $(this).css('-webkit-background-clip', 'text')
        $('.rate input').val(Math.ceil(rateNumber / 20) * 20 / 20)
    }).on('click',function () {
		$.ajax({
			url: 'index.php?route=blog/blog/rate&blog_id=<?php echo $blog_id; ?>',
			type: 'post',
			dataType: 'json',			
			data: 'rate=' + $('.rate input').val(),
			beforeSend: function() {
				//loading start
                $('#customer-rate').css('pointer-events','none')
			},
			complete: function() {
				//loading end
			},
			success: function(json) {

				if (json['error']) {
					alert (json['error']);
				}
				
				if (json['success']) {
					html = '<b class="text-secondary">امتیاز این مطلب: </b>';
					html += '<span class="text-secondary fs-3 mx-2">' + json['rate'] + ' </span>';
                    html += '<i class="icon-font fs-3" style="--i:' + json['rate'] * 20 + '%"></i>';					
					$('#rate .fixed-rate').html(html);
				
					html = '<b class="text-secondary">امتیاز شما: </b>';
					html += '<span class="text-secondary fs-5 mx-2">' + $('.rate input').val() + ' </span>';
                    html += '<i class="icon-font" style="--i:' + parseInt($('.rate input').val()) * 20 + '%"></i>';
					$('#customer-rate').html('<div class="d-flex justify-content-end align-items-center fixed-rate text-end position-relative">' + html + '</div>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});     
    })
</script>

<!-------------------
COMMENTS LOGICS
------------------->

<script type="text/javascript">

$('.like').on('click', function() {
	<?php if ($is_logged) { ?>
		$.ajax({
			url: 'index.php?route=blog/blog/likePost&blog_id=<?php echo $blog_id; ?>',
			type: 'post',
			dataType: 'json',			
			complete: function() {
				//$('#button-comment').button('reset');
			},
			success: function(json) {
				console.log(json);
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
					alert (json['error']);
				}
				
				if (json['success']) {
					var element = $('.like');
					$('#count-liked').text(json['count_liked']);
					$(element).removeClass();
					$(element).addClass('icon-font icon-heart-fill py-2 text-primary liked');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});     
	<?php } else { ?>
		alert('برای لایک ابتدا باید وارد شوید!');
		$('#login-form').modal('show');
	<?php } ?>
});

function likeComment (blog_comment_id, status) {
	<?php if ($is_logged) { ?>
		$.ajax({
			url: 'index.php?route=blog/blog/likeComment',
			type: 'post',
			dataType: 'json',			
			data: 'status=' + status + '&blog_comment_id=' + blog_comment_id,
			complete: function() {
				//$('#button-comment').button('reset');
			},
			success: function(json) {
				console.log(json);
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
					alert (json['error']);
				}
				
				if (json['success']) {
					$('#like-' + blog_comment_id).text(json['liked']);
					$('#dislike-' + blog_comment_id).text(json['disliked']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});     
	<?php } else { ?>
		alert('برای لایک ابتدا باید وارد شوید!');
		$('#login-form').modal('show');
	<?php } ?>
}

/**** ON LOAD ****/ 

$(document).ready(function(){

  $(".btn-owl-post").mouseover(function(){
    $(this).children('.cart').css('display', 'none');
    $(this).children('.price').css('display', 'block');
  });
  $(".btn-owl-post").mouseout(function(){
    $(this).children('.price').css('display', 'none');
    $(this).children('.cart').css('display', 'block');
  });
});

$('#comment').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
	$("html,body").animate({scrollTop:(($("#comment").offset().top)-50)},500);

    $('#comment').load(this.href, function() {
		$('#comment').fadeOut(0);
		$('#comment').fadeIn(500);
	});

	
});

$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');

</script>

<script>
    const btn = document.querySelector("i.icon-link");
    function webShareAPI(header, description, link) {
        navigator
            .share({
                title: header,
                text: description,
                url: link
            })
            .then(() => console.log("Successful share"))
            .catch((error) => console.log("Error sharing", error));
    }
    if (navigator.share) {
        btn.style.display = "block";
        btn.addEventListener("click", () =>
            webShareAPI("header", "description", window.location.pathname.split("/").pop())
        );
    } else {
        btn.style.display = "none";
        console.error("Your Browser doesn't support Web Share API");
        document.write("Your Browser doesn't support Web Share API");
    }
</script>

<script type="text/javascript">

$('#button-comment').on('click', function() {
	$.ajax({
		url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
		type: 'post',
		dataType: 'json',
		//data: 'comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()) + '&name=' + encodeURIComponent($('input[name=\'name\']').val()),
        data: $("#comment-form").serialize(),
		//data: $("#comment_form").serialize(),
		
		complete: function() {
			$('#button-comment').button('reset');
			//$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			//$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			console.log(json);
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('input[name=\'name\']').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('input[name=\'name\']').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('textarea[name=\'comment\']').val('');
				$('input[name=\'name\']').val('');
				$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});     
</script>
<?php if($allow_comment) { ?>
<script type="text/javascript">
function reply (blog_comment_id, element) {
	$('.comment').remove();
	var html = '<form class="comment offset-3 text-end flex-fill" id="reply-comment-form">';
	html += '		<input type="text" name="reply_name" value="" id="input-reply-name" placeholder="نام شما" class="form-control" />';
	html += '		<textarea name="reply_comment" placeholder="پاسخ به دیدگاه: ' + $(element).data('short-comment') + ' ..." class="border-0 bg-light rounded-2 p-2 mt-2 w-100" rows="5"></textarea>';
	html += '		<button onclick="$(\'.comment\').remove();" class="btn btn-sm rounded-1 btn-danger px-3">لغو</button>';
	html += '		<button onclick="addReply (' + blog_comment_id + ');" class="btn btn-sm rounded-1 btn-success"><?php echo $text_write_comment; ?></button>';
	html += '	</form>';
	<?php if ($is_mobile) { ?>
	$(element).parent().parent().parent().after(html);
	<?php } else { ?>
	$(element).parent().parent().after(html);
	<?php } ?>
}

function addReply (blog_comment_id) {
	$.ajax({
		url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>&blog_comment_id=' + blog_comment_id',
		type: 'post',
		dataType: 'json',
		//data: 'comment=' + encodeURIComponent($('textarea[name=\'reply_comment\']').val()) + '&name=' + encodeURIComponent($('input[name=\'reply_namet\']').val()) + '&blog_comment_id=' + blog_comment_id,
        data: $("#reply-comment-form").serialize(),
		
		complete: function() {
			$('.send-txt-faq').button('reset');
		},
		success: function(json) {
			console.log(json);
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('textarea[name=\'reply_comment\']').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				
				$('.comment').remove();

				$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
}   
 
</script>
<?php } ?>
<?php echo $footer; ?> 