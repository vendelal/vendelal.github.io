d3.json("data/outfit-data.json", function(error, data) {

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

	render(outfits);


//---------------------------------------------------------------------------


	// Filter by season
	// Only return data points with the given season

	// Filter by Winter
	var winter = document.getElementById('winter');
	winter.onclick = 
	function filterByWinter(){

		// // Remove all of the rendered outfits
		var container = document.getElementsByClassName('outfit-images')[0];
		container.innerHTML = "";

		// Create empty array and then fill it with the outfits of that season if it matches the name on the button
		var filteredArr = [];

		for (var i = 0; i < outfits.length; i++) {
			var outfitSeason = outfits[i].date.season;

			if ("winter" === outfitSeason) {
				filteredArr.push(outfits[i]);
			}
		}
		
		render(filteredArr);
	}


	// Filter by Summer
	var summer = document.getElementById('summer');
	summer.onclick = 
	function filterBySummer(){

		// // Remove all of the rendered outfits
		var container = document.getElementsByClassName('outfit-images')[0];
		container.innerHTML = "";

		// Create empty array and then fill it with the outfits of that season if it matches the name on the button
		var filteredArr = [];

		for (var i = 0; i < outfits.length; i++) {
			var outfitSeason = outfits[i].date.season;

			if ("summer" === outfitSeason) {
				filteredArr.push(outfits[i]);
			}
		}
		
		render(filteredArr);
	}


});



















