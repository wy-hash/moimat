/**
 * 모든 페이지에 필요한 공통 스크립트.
 */

// 데스크탑 크기로 리사이즈시 메인네비 복원
$(document).ready(function() {
	$(window).resize(function() {
		$(window).width() >= 768 ? /mainnav/.test($('#container').attr('class')) ? $('#container').attr('class', $('#container').attr('class').replace(/(?<=mainnav\-)[^l]\w/, 'lg')) : $('#container').addClass('mainnav-lg') : '' ;
	});
	
	$(window).resizeEnd(function() {
		$(window).width() >= 768 && !(/mainnav/.test($('#container').attr('class'))) ? $('#container').addClass('mainnav-lg') : '' ;
	});
});