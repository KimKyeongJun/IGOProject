//  메인페이지 JS

$(function(){
	
	var txtArr = ['교통지옥', '지하철고장', '어디로가나'];
	
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 1,
		//spaceBetween: 30,
		loop: true,
		navigation: {
			nextEl: '.ab2',
			prevEl: '.ab1',
		},
		pagination: {
			//el: '.swiper-pagination',
			el: '.bulletBox',
			clickable: true,
			renderBullet: function (index, className) {
				return '<a href="#" class="'+className+'"><span>#</span>' + txtArr[index] + "</a>";
			},
		},
	});	
	
});//////// jQB //////////////////////////////









