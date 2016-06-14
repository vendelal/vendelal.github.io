d3.json("data/outfit-data.json", function(error, data) {

	// Make sure the data loads
    console.log("loaded!");
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
	for (var i = 0; i < outfits.length; i++) {
		var backgroundImgUrl = outfits[i].img;
		var outfitId = outfits[i].id;
		var makeDiv = document.createElement('div');
		var outfitContainer = document.getElementsByClassName("outfit-images")[0];

		makeDiv.id = outfitId;
		makeDiv.className = 'col-sm-2 outfit-image';
		outfitContainer.appendChild(makeDiv);

		function setBackground(n) {
    		if (outfitId === n) {
    			document.getElementById(n).style.backgroundImage = "url('" + backgroundImgUrl + "')";
    			console.log('this is being run!');
    		}
    	}

    	setBackground(outfitId);
	};

});
