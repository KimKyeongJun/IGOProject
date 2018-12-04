/////////// search Ico  /////////////
 function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

		function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
			obj.action = "search.jsp";

        }

       


////////////////////////////////////////////////////////////////////////







///////////// 전역 변수 구역	/////////////////////////////////


var snum=0;

	//window.addEventListener("load",function(){				
	$(document).ready(function() {
		var tsts=0;			
		//document.getElementById("ham").onclick=function(){	
		$('#ham').on('click', function() {
			var navi=$("#navM");		
			if(tsts===0){					
				navi.show(300);		
				
				$(this).removeClass('ion-ios-menu').html("<span class='mClose'></span>");				
				$('.mClose').css("transform", "rotate(45deg)");
				$('.mClose').css("transition", "all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570)");
				$('.mClose').css("transition-delay", "0.5s");				
					
				tsts=1;
			}
			else if(tsts===1){		
				navi.hide(300);
				$(this).html("").addClass("ion-ios-menu");
				tsts=0;
			}
		});
		
		/////////// 메뉴~~~~~~~~~~~~~~ /////////////			
		$("#navM ul.sub").hide();
		$("#navM ul.active li").click(function(){
			$("ul",this).slideToggle("fast");
		});
		///////////// load구역 ////////////////////////////////
		
        
        $(function() {
            $("#top_btn").on("click", function() {
                $("html, body").animate({scrollTop:0}, '500');
                return false;
            });
        });
        	
	});
		
	

$(document).ready(function(){
    // modalCenter
    function modalCenter(){
        var modal_w = $(".modal").width()/2;
        $(".modal").css("margin-left", -modal_w);
        var modal_h = $(".modal").height()/2;
        $(".modal").css("margin-top", -modal_h);
    }
    modalCenter();
    $(window).resize(function(){
        modalCenter();
    });
    // modal on/off
    function modalOn(text){
        $(".modal").addClass("modal_on");
        $(".modal_back").addClass("back_on");
        $("body").addClass("body_lock");
    }
    function modalOff(){
        $(".modal").removeClass("modal_on");
        $(".modal_back").removeClass("back_on");
        $("body").removeClass("body_lock");
    }
    $("#loginClick").click(function(){
        modalOn();
		$("#navM").hide(300);
		$("#ham").html("").addClass("ion-ios-menu");
    });
    $(".modal_x").click(function(){
        modalOff();
		$("#navM").show(300);
		$("#ham").removeClass('ion-ios-menu').html("<span class='mClose'></span>");				
				$('.mClose').css("transform", "rotate(45deg)");
				$('.mClose').css("transition", "all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570)");
				$('.mClose').css("transition-delay", "0.5s");	
    });

	
		$(".joinBtn1").click(function(){location.href="#";});
		$(".joinBtn2").click(function(){location.href="#";});
});



	



	