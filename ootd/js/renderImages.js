d3.json("data/outfit-data.json", function(error, data) {
	Sugar.extend()

	// Make sure the data loads
    if (error) {
        console.log(error.status, error.statusText);
    }
    else {
        console.log(data);
    }


    // Set variables
    var outfits = data.outfits.listOfOutfits;
    var elements = document.getElementsByClassName('outfit-image'); // returns array of all .outfit-images elements


    // Loop through each outfit and create a div with the outfit ID and the corresponding background image
    function render(arr){
    	var container = document.getElementsByClassName('outfit-images')[0];
        container.innerHTML = "";
		for (var i = 0; i < arr.length; i++) {
			var backgroundImgUrl = arr[i].img;
			var outfitId = arr[i].id;
			var makeDiv = document.createElement('div');
			var outfitContainer = document.getElementsByClassName("outfit-images")[0];

			makeDiv.id = outfitId;
			makeDiv.className = 'col-sm-2 outfit-image';
			outfitContainer.appendChild(makeDiv);

			function setBackground(n) {
	    		document.getElementById(n).style.backgroundImage = "url('" + backgroundImgUrl + "')";
	    	}

	    	setBackground(outfitId);
		};
	}


//---------------------------------------------------------------------------

	// Clear all the filters

	$("#clear_filters_button").on('click', function(){
		render(outfits);
	})




//---------------------------------------------------------------------------


	// Filter by season
	// Only return data points with the given season

	var filter_by_season = function(season){
		return outfits.filter(function(outfit){
			return outfit.date.season == season;
		})
	}


	$('#season_filter_buttons button').each(function(){
		var season = $(this).attr('id');
		$(this).on('click', function(){
			var filtered = filter_by_season(season);
			render(filtered);
		})
	})






//---------------------------------------------------------------------------

	// Generate color buttons
	// Based on what colors I've used in my closet

	// Loop through each outfit and find the colors in each artcile of clothing
	var generate_colors = function(){
		var colors = [];
		for (var i = 0, l = outfits.length; i < l; i++) {
			var outfit = outfits[i];
			for (var j = 0, k = outfit.clothes.length; j < k; j++) {
				colors.push(outfit.clothes[j].tags.color);
			}
		}

		// Get only the unique color values
		return colors.unique();
	}

	// Take the array of colors and make buttons out of them
	var generate_color_buttons = function(){
		var colors = generate_colors();
		colors.forEach(function(color){
			var button = $('<button/>', {
				// text: color.titleize(),
				click: function(){
					var filtered_colors = filter_by_color(color);
					render(filtered_colors);
				}
			}).css({'background-color':color, 'width':'20px', 'height':'20px', 'border-radius':'10px'});
			var container = $('#color_filter_buttons');
			container.append(button);
		})
	}


	// Filter by color
	// Only return data points with the given color

	var filter_by_color = function(color){
		return outfits.filter(function(outfit){
			return outfit.clothes.filter(function(clothing_article){
				return clothing_article.tags.color == color;
			}).length > 0; // take the length because empty array evaluates to true in javascript
		})
	}





//---------------------------------------------------------------------------

	// CALL ALL THE SHIT

	render(outfits);
	generate_color_buttons();


});



















