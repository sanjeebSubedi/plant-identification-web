var host = 'http://192.168.1.5:5000'
// var host = 'localhost:5000'

$("#predict-button").hide();
$("#top-3-label").hide();
let base64Image;
function readURL(input) {
	if (input.files && input.files[0]) {
		$("#predict-button").show();
		var reader = new FileReader();
		reader.onload = function (e) {
			//	let dataURL = reader.result;
			$("#selected-image").attr({
				"src": e.target.result,
				"height": 300,
				"width": 300
			}
			);
			base64Image = e.target.result.replace(
				/^data:image\/(png|jpg|jpeg);base64,/, ""
			);
			//	base64Image = dataURL.replace("data:image/png;base64,","");
			console.log(base64Image);
		};
		reader.readAsDataURL(input.files[0]);
	}
}
$("#select-button").change(function () {
	readURL(this);
});
var top3;
$("#predict-button").click(function (event) {
	$("#top-3-label").show();
	let message = { image: base64Image };
	console.log(message);
	$.post(host,
		JSON.stringify(message),
		function (response) {
			top3 = Object.values(response)[0];
			console.log(top3);
			$("#top-1").text(Object.keys(top3)[0] + ": " + Object.values(top3)[0] + "%");
			$("#top-2").text(Object.keys(top3)[1] + ": " + Object.values(top3)[1] + "%");
			$("#top-3").text(Object.keys(top3)[2] + ": " + Object.values(top3)[2] + "%");
		}
	);
});

$("#top-1").click(function(event) {
	let plant_name = Object.keys(top3)[0];
	plant_name = plant_name.toLowerCase()
	console.log(plant_name);
	let endpoint = "/details/"+plant_name
	$("html").load(endpoint);
});

$("#top-2").click(function(event) {
	let plant_name = Object.keys(top3)[1];
	plant_name = plant_name.toLowerCase()
	console.log(plant_name);
	let endpoint = "/details/"+plant_name
	$("html").load(endpoint);
});

$("#top-3").click(function(event) {
	let plant_name = Object.keys(top3)[2];
	plant_name = plant_name.toLowerCase()
	console.log(plant_name);
	let endpoint = "/details/"+plant_name
	$("html").load(endpoint);
	// $.get("details/rose",
	// 	function (response) {
	// 		window.location.href = response.redirect
	// 	}
	// );
});