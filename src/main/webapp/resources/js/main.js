$(document).ready(function(){	
	$('#show').delay(5000).fadeOut(800);
	var app = new Application();
	app.loadMenu();
	
	$("#checkout").click(function(){
		alert("Send to the db");
	});
});


function send(data){
	var url = location.protocol + '//' + location.host + "/sombra" + "/json/addToCart/" + data;
	$.getJSON(url);
	hideElem(data);
};

function hideElem(data){
	$("#lot_"+data).hide();
}

function rem(data){
	var url = location.protocol + '//' + location.host + "/sombra" + "/json/remove/" + data;
	$.getJSON(url, function(json){
		if(json == 0){
			location.reload();
		}
	});
	
	hideElem(data);
};

function Application(){
	this.loadMenu = function(){
		var url = location.protocol + '//' + location.host + "/sombra/json/tree";
		var urlMenu = location.protocol + '//' + location.host + "/sombra/category/";
		$.getJSON(url, function(json){
			var data = json;
			
			function parseMenu(ul, menu) {
			    for (var i=0;i<menu.length;i++) {
			        if (menu[i].childList!=null) {
			        	var item = menu[i];
			        	var li  = $('<li class="dropdown"> ' );
			        	a = $('<a href="' + urlMenu + menu[i].id+'">' + menu[i].name  +' <span class="caret"></span></a>');
			        	var ull = $('<ul class="dropdown-menu sub-menu">');
			        	$(ul).append(li);
			        	if(item.childList.length == 0){
			        		a = $('<a href="' + urlMenu + menu[i].id+'">' + menu[i].name  +'</a>');
			        		$(li).append(a);
			        		parseMenu($(a), menu[i].childList);
			        	} else {
			        		$(li).append(a);
			        		$(li).append(ull);
			        		parseMenu($(ull), menu[i].childList);
			        	} 			        	
			        	$(ul).append('</ul></li>');
			        } 
			    }
			}
			
			var menu=$('#menu');
			parseMenu(menu, data);
		});	
	};
}