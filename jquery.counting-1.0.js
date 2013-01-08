// Generated by CoffeeScript 1.4.0
/*
# jquery.counting
# Simple Countdown Plugin.
#
# Examples and document at http://oame.github.com/jquery.counting
#
# Copyright(C) 2013 o_ame http://oameya.com
# version: 1.0
# require: jQuery 1.7.2+
# license: MIT License
*/(function(){jQuery(function(){$.counting=function(e,t){var n,r,i,s,o,u,a,f,l,c,h,p,d,v,m,g;u=1;f=1e3;a=6e4;o=36e5;s=864e5;n={format:"%d日%H時間%m分%s秒",countUntil:null,outdated_message:"期日になりました。"};l={};r=$(e);i=null;c=function(e,t){return e.replace(/%(.)/g,function(e,n){return t[n]&&typeof t[n]!="object"?t[n].toString():JSON.stringify(t[n])})};d=function(){var e=this;i=setInterval(function(){return g()},u);return g()};v=function(){return clearInterval(i)};m=function(){var e,t,n,r,i,u,c;u=(new Date).getTime();n=l.countUntil-u;if(n<0)return 0;e=parseInt(n/s);t=parseInt(n%s/o);i=parseInt(n%s%o/a);c=parseInt(n%s%o%a/f);r=n;return{d:e,H:t,m:i,s:c,M:r}};g=function(){var e;if(e=m()){l.onCount!=null&&l.onCount(r);return r.html(c(l.format,e))}v();l.onOutdated!=null&&l.onOutdated(r);return r.html(l.outdated_message)};h=function(){l=$.extend({},n,t);l.countUntil=Date.parse(r.html());r.data("outdated")!=null&&(l.outdated_message=r.data("outdated"));r.data("format")!=null&&(l.format=r.data("format"));return d()};p=function(e){return typeof console!="undefined"&&console!==null?console.log(e):void 0};h();return this};return $.fn.counting=function(e){return this.each(function(){var t;if(void 0===$(this).data("counting")){t=new $.counting(this,e);return $(this).data("counting",t)}})}})}).call(this);