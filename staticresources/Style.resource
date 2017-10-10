<style>
	* {
		font-size   : 14px;
	}

	body {
		margin      : 0px auto;
		max-width   : 1000px;
		padding     : 0px;
	}

	#logo img {
		max-width : 150px;
		height    : auto;
	}

	#brand {
		margin      : auto auto;
		color       : red;
		font-size   : 35px;
		font-style  : italic;
	}

	#header {
		max-height : 150xp;
	}

	#info span {
		font-weight : bold;
		padding     : 5px;
		border      : 1px solid black;
		display     : inline-block;
		margin      : 5px auto;
	}

	#control_button #create_new_button, #list_button {
		width       : 140px;
		height      : 40px;
		font-weight : bold;
		font-size   : 14px;
		border      : 1px solid;
	}

	#create_new_button, #list_button : hover {
		background-color : green;
	}

	#weather_info {
		max-width : 60%;
		margin    : auto;
		color     : red;
	}

	#weather_info h2 {
		color       : blue;
		font-weight : bold;
		font-style  : italic;
	}

	#weather_info span {
		font-size : 20px; !important
	}

	#table {
		margin-top : 15px;
	}

	#table label {
		margin       : 10px auto;
		font-size    : 30px;
		padding-left : 15px;
		color        : #56BCFF;
	}

	/* Paste this css to your style sheet file or under head tag */
	/* This only works with JavaScript,
	if it's not present, don't show loader */
	.no-js #loader { display: none;  }
	.js #loader { display: block; position: absolute; left: 100px; top: 0; }
	.se-pre-con {
	    position   : fixed;
	    left       : 0px;
	    top        : 0px;
	    width      : 100%;
	    height     : 100%;
	    z-index    : 9999;
	    background : rgba(48, 52, 61, 0.8);
	}

	.se-pre-con img {
		position   : fixed;
	    left       : calc( 50% - 30px );
	    top        : calc( 50% - 30px );
	    width      : 30px;
	    height     : 30px;
	    z-index    : 9999;
	}

	#info_detail {
		margin       : 15px;
		padding-left : 20px;
	}

	#info_detail h2 {
		font-size     : 20px;
		margin-bottom : 10px;
	}

	#pagination {
		margin : 20px auto;
	}

	#pagination li {
		display    : inline-block;
		min-width  : 50px;
		text-align : center;
	}

</style>