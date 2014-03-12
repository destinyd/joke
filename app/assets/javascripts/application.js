// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require bootstrap
//= require jquery.lazyload.min
// require_tree .
var duoshuoQuery = {short_name:"ddjoke"};
$(function() {
  $("img.lazy").lazyload();
  var ds = document.createElement('script');
  ds.type = 'text/javascript';ds.async = true;
  ds.src = 'http://static.duoshuo.com/embed.js';
  ds.charset = 'UTF-8';
  (document.getElementsByTagName('head')[0] 
   || document.getElementsByTagName('body')[0]).appendChild(ds);
  $('body').
  on('mouseenter','#bdshare_weixin_qrcode_dialog_qr',function(){console.log(this);$('#bdshare_weixin_qrcode_dialog table').width($('#bdshare_weixin_qrcode_dialog table').height())}).
  on('mouseleave','#bdshare_weixin_qrcode_dialog_qr',function(){console.log(this);$('#bdshare_weixin_qrcode_dialog table').width($('#bdshare_weixin_qrcode_dialog table').height())})//.
})
