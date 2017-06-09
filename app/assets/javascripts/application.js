// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery-ui
//= require materialize-sprockets

//carousel 设置

$(document).ready(function(){
  $('.carousel').carousel();
});
// Pause slider
$('.slider').slider('pause');
// Start slider
$('.slider').slider('start');
// Next slide
$('.slider').slider('next');
// Previous slide
$('.slider').slider('prev');


// Next slide
$('.carousel').carousel('next');
$('.carousel').carousel('next', 3); // Move next n times.
// Previous slide
$('.carousel').carousel('prev');
$('.carousel').carousel('prev', 4); // Move prev n times.
// Set to nth slide
$('.carousel').carousel('set', 4);

$('.pushpin-demo-nav').each(function() {
  var $this = $(this);
  var $target = $('#' + $(this).attr('data-target'));
  $this.pushpin({
    top: $target.offset().top,
    bottom: $target.offset().top + $target.outerHeight() - $this.height()
  });
});

 $('.carousel.carousel-slider').carousel({fullWidth: true});
// 图片自适应大小支持代码块
// 在product/show.html.erb的页面中，对img图片用这一格式进行校正
// 让图片在大于div宽度时自动缩小不而溢出，确保版面的公正和美观
function ReImgSize(){
  for (j=0;j<document.images.length;j++)
  {
    document.images[j].width=(document.images[j].width>420)?"420":document.images[j].width;
  }
}

$(document).on('mouseover', '.intro-preview-item', function () {
    var src = $(this).find('img').attr('src')
    $('.intro-bigPic img').attr('src', src)
    $('#thumb-lens').css('background-image', 'url(' + src + ')')
    $(this).addClass('intro-preview-activeItem').siblings().removeClass('intro-preview-activeItem')
    m.attach({
        thumb: '#thumb',
        large: src,
        largeWrapper: 'preview'
    })
})

$('.intro-preview-activeItem').trigger('mouseover')
$(document).on('mouseover', '.magnifier-thumb-wrapper', function (e) {
    $('#preview').css('visibility', 'visible')
})
$(document).on('mouseout', '.magnifier-thumb-wrapper', function (e) {
    $('#preview').css('visibility', 'hidden')
})



$(window).scroll(function () {                            //指的是当屏幕滚动时，所触发的功能
    if ($(this).scrollTop() > 125) {                      //指的是当屏幕滚动到125px的高度时，所触发的行为
        $('#navbar').addClass('show_bgcolor')             //指的是抓取ID为navbar的物件，并加入名为show_bgcolor的CSS属性
    } else {
        $('#navbar').removeClass('show_bgcolor')
    }
})
