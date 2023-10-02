extends Node

enum carColor {
	BLACK,
	BLUE,
}

var carListSmall = {
	"car_1": {
		"carBrand": "KIND",
		"carNumber": "KND-042",
	},
	"car_2": {
		"carBrand": "NIVO",
		"carNumber": "SUZ-322",
	},
	"car_3": {
		"carBrand": "CUTE",
		"carNumber": "ART-033",
	},
	"car_4": {
		"carBrand": "ROOMBA",
		"carNumber": "LMP-474",
	},
	"car_5": {
		"carBrand": "SLEEP",
		"carNumber": "SON-404",
	},
	"car_1_not": {
		"carBrand": "LODA",
		"carNumber": "QPQ-222",
	},
	"car_2_not": {
		"carBrand": "TDN",
		"carNumber": "OST-404"
	},
	"car_3_not": {
		"carBrand": "NIVO",
		"carNumber": "ABC-200",
	}
}

var carList = {
	"level_1": {
		"car_1": {
			"name": 'John',
			"surname": 'Smith',
			"carBrand": 'SMP',
			"carColor": carColor.BLUE,
			"carNum": 'ABC-789',
		},
		"car_2": {
			"name": "Emily",
			"surname": "Johnson",
			"carBrand": "TDN",
			"carColor": carColor.BLACK,
			"carNum": "PQR-465",
		},
		"car_3": {
			"name": "James",
			"surname": "Anderson",
			"carBrand": "LODA",
			"carColor": carColor.BLUE,
			"carNum": "JKL-890",
		},
		"car_4": {
			"name": "Benjamin",
			"surname": "Mitchell",
			"carBrand": "LODA",
			"carColor": carColor.BLACK,
			"carNum": "KAK-101",
		}
	}
}
