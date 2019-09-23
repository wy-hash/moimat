/**
 * 모든 페이지에 필요한 공통 스크립트.
 */

$(document).ready(function() {
	$(window).resize(function() {
		// 데스크탑 크기로 리사이즈시 메인네비 복원
		$(window).width() >= 768 ? /mainnav/.test($('#container').attr('class')) ? $('#container').attr('class', $('#container').attr('class').replace(/(?<=mainnav\-)[^l]\w/, 'lg')) : $('#container').addClass('mainnav-lg') : '' ;
	});
	
	$(window).resizeEnd(function() {
		// 창 키웠을때 mainnav- 관련 클래스 없으면 넣어줌.
		if ($(window).width() >= 768 && !(/mainnav/.test($('#container').attr('class')))) $('#container').addClass('mainnav-lg');
	});
});