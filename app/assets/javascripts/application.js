// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery

//= require map.js
//= require qrcode.js
//= require bootstrap-sprockets
//= require turbolinks



var loadqrpub
loadqrpub = function() {
  function render_QR (){
    var qrcode = new QRCode("pub_qrcode")
    var qrcode2 = new QRCode("priv_qrcode")
    var elpub_ad = document.getElementById("pub_ad");
    var elpriv_ad = document.getElementById("priv_ad");
    qrcode.makeCode(elpub_ad.value);
    qrcode2.makeCode(elpriv_ad.value);
  }
  
  render_QR();
}

$('.wallets.index').ready(loadqrpub)
