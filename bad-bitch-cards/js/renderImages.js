d3.json("data/bitches-data.json", function(error, data) {
	Sugar.extend()

	// Make sure the data loads
    if (error) {
        console.log(error.status, error.statusText);
    }
    else {
        console.log(data);
    }


    // Set variables
    var bitches = data.bitches.listOfBitches;
    var elements = document.getElementsByClassName('bitch-image'); // returns array of all .bitches-images elements


    // Loop through each bitches data object and create a div with the bitch ID and the corresponding background image
    function render(arr){
    	var container = document.getElementsByClassName('bitches-images')[0];
        container.innerHTML = "";
		for (var i = 0; i < arr.length; i++) {
			var imgURL = arr[i].frontImg;
			var backImgURL = arr[i].backImg;
			var bitchId = arr[i].id;

			var bootstrapCol = document.createElement('div');
			bootstrapCol.className = 'col-xs-12 col-sm-6 col-md-3';

			var cardGrid = document.createElement('div');
			cardGrid.className = 'card-grid bitch-image';
			bootstrapCol.appendChild(cardGrid);

			var front = document.createElement('div');
			front.className = 'front';
			var frontImg = document.createElement('img');
			frontImg.setAttribute("src", imgURL);
			front.appendChild(frontImg);
			cardGrid.appendChild(front);

			var back = document.createElement('div');
			back.className = 'back';
			var backImg = document.createElement('img');
			backImg.setAttribute("src", backImgURL);
			back.appendChild(backImg);
			cardGrid.appendChild(back);

			container.appendChild(bootstrapCol);
		};
	}

	render(bitches);

	$(function($) {
        $(".card-grid").flip({
          trigger: 'hover',
        }); 
    });
});

















