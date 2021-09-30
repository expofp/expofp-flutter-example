import 'dart:convert';

import 'package:expofp/models/exhibitor.dart';

List<Exhibitor> getExhibitors() {
  Iterable l = json.decode(exhibitorsJson);
  return List<Exhibitor>.from(l.map((model) => Exhibitor.fromJson(model)));
}

var exhibitorsJson = """
[
	{
		"id": "1-wimpole-street",
		"name": "1 Wimpole Street",
		"booths": [
			{
				"id": "1306",
				"name": "1306"
			},
			{
				"id": "2206",
				"name": "2206"
			}
		]
	},
	{
		"id": "apple",
		"name": "Apple",
		"booths": [
			{
				"id": "1102",
				"name": "1102"
			},
			{
				"id": "3402",
				"name": "3402"
			}
		]
	},
	{
		"id": "attend2it",
		"name": "Attend2it",
		"booths": [
			{
				"id": "1213",
				"name": "1213"
			}
		]
	},
	{
		"id": "aventri",
		"name": "Aventri",
		"booths": [
			{
				"id": "1205",
				"name": "1205"
			},
			{
				"id": "v4310",
				"name": "V4310"
			},
			{
				"id": "v4312",
				"name": "V4312"
			}
		]
	},
	{
		"id": "balou",
		"name": "Balou",
		"booths": [
			{
				"id": "4304",
				"name": "4304"
			}
		]
	},
	{
		"id": "blitz",
		"name": "Blitz",
		"booths": [
			{
				"id": "1410",
				"name": "1410"
			}
		]
	},
	{
		"id": "choose-2-rent",
		"name": "Choose 2 Rent",
		"booths": [
			{
				"id": "1209",
				"name": "1209"
			}
		]
	},
	{
		"id": "coconnex",
		"name": "Coconnex",
		"booths": [
			{
				"id": "v4430",
				"name": "V4430"
			}
		]
	},
	{
		"id": "collect-by-goomeo",
		"name": "COLLECT by Goomeo",
		"booths": [
			{
				"id": "1309",
				"name": "1309"
			}
		]
	},
	{
		"id": "crowd-connected",
		"name": "Crowd Connected",
		"booths": [
			{
				"id": "1405",
				"name": "1405"
			},
			{
				"id": "v4314",
				"name": "V4314"
			}
		]
	},
	{
		"id": "crowdcomms",
		"name": "Crowdcomms",
		"booths": [
			{
				"id": "1306",
				"name": "1306"
			}
		]
	},
	{
		"id": "crystal-interactive",
		"name": "Crystal Interactive",
		"booths": [
			{
				"id": "1312",
				"name": "1312"
			}
		]
	},
	{
		"id": "cvent",
		"name": "Cvent",
		"booths": [
			{
				"id": "1701",
				"name": "1701"
			}
		]
	},
	{
		"id": "d2i-systems",
		"name": "D2i Systems",
		"booths": [
			{
				"id": "v4419",
				"name": "V4419"
			},
			{
				"id": "v4421",
				"name": "V4421"
			},
			{
				"id": "v4423",
				"name": "V4423"
			}
		]
	},
	{
		"id": "dbpixelhouse",
		"name": "DBpixelhouse",
		"booths": [
			{
				"id": "1313",
				"name": "1313"
			}
		]
	},
	{
		"id": "delegate-select",
		"name": "Delegate Select",
		"booths": [
			{
				"id": "1308",
				"name": "1308"
			}
		]
	},
	{
		"id": "evenito",
		"name": "evenito",
		"booths": [
			{
				"id": "1104",
				"name": "1104"
			}
		]
	},
	{
		"id": "event-engine",
		"name": "Event Engine",
		"booths": [
			{
				"id": "1110",
				"name": "1110"
			}
		]
	},
	{
		"id": "event-industry-news",
		"name": "Event Industry News",
		"booths": [
			{
				"id": "3102",
				"name": "3102"
			},
			{
				"id": "3201",
				"name": "3201"
			}
		]
	},
	{
		"id": "eventboost",
		"name": "Eventboost",
		"booths": [
			{
				"id": "1304",
				"name": "1304"
			}
		]
	},
	{
		"id": "eventeye",
		"name": "EventEye",
		"booths": [
			{
				"id": "1512",
				"name": "1512"
			}
		]
	},
	{
		"id": "eventit",
		"name": "Eventit",
		"booths": [
			{
				"id": "2407",
				"name": "2407"
			}
		]
	},
	{
		"id": "eventmobi",
		"name": "EventMobi",
		"booths": [
			{
				"id": "1403",
				"name": "1403"
			}
		]
	},
	{
		"id": "eventprofinder",
		"name": "EventProFinder",
		"booths": [
			{
				"id": "2406",
				"name": "2406"
			}
		]
	},
	{
		"id": "eventsair",
		"name": "EventsAIR",
		"booths": [
			{
				"id": "1307",
				"name": "1307"
			}
		]
	},
	{
		"id": "eventscase",
		"name": "Eventscase",
		"booths": [
			{
				"id": "1105",
				"name": "1105"
			},
			{
				"id": "1106",
				"name": "1106"
			}
		]
	},
	{
		"id": "eventsforce",
		"name": "Eventsforce",
		"booths": [
			{
				"id": "1402",
				"name": "1402"
			}
		]
	},
	{
		"id": "evessio",
		"name": "evessio",
		"booths": [
			{
				"id": "1310",
				"name": "1310"
			}
		]
	},
	{
		"id": "evolution-dome",
		"name": "Evolution Dome",
		"booths": [
			{
				"id": "1101",
				"name": "1101"
			},
			{
				"id": "1511",
				"name": "1511"
			},
			{
				"id": "2300",
				"name": "2300"
			}
		]
	},
	{
		"id": "example-company",
		"name": "Example Company",
		"booths": [
			{
				"id": "2205",
				"name": "2205"
			}
		]
	},
	{
		"id": "explori",
		"name": "Explori",
		"booths": [
			{
				"id": "2102",
				"name": "2102"
			}
		]
	},
	{
		"id": "expofpcom",
		"name": "ExpoFP.com",
		"booths": [
			{
				"id": "v4209",
				"name": "V4209"
			},
			{
				"id": "v4211",
				"name": "V4211"
			},
			{
				"id": "v4212",
				"name": "V4212"
			}
		]
	},
	{
		"id": "expoplatform",
		"name": "ExpoPlatform",
		"booths": [
			{
				"id": "1409",
				"name": "1409"
			}
		]
	},
	{
		"id": "exposure-analytics",
		"name": "Exposure Analytics",
		"booths": [
			{
				"id": "3102",
				"name": "3102"
			},
			{
				"id": "3201",
				"name": "3201"
			}
		]
	},
	{
		"id": "firebird-systems",
		"name": "Firebird Systems",
		"booths": [
			{
				"id": "1509",
				"name": "1509"
			}
		]
	},
	{
		"id": "first-sight-media",
		"name": "First Sight Media",
		"booths": [
			{
				"id": "1109",
				"name": "1109"
			}
		]
	},
	{
		"id": "giant-itab",
		"name": "Giant iTab",
		"booths": [
			{
				"id": "1511",
				"name": "1511"
			}
		]
	},
	{
		"id": "gleanin",
		"name": "Gleanin",
		"booths": [
			{
				"id": "1504",
				"name": "1504"
			}
		]
	},
	{
		"id": "glisser",
		"name": "Glisser",
		"booths": [
			{
				"id": "1602",
				"name": "1602"
			}
		]
	},
	{
		"id": "google",
		"name": "Google",
		"booths": [
			{
				"id": "v4317",
				"name": "V4317"
			},
			{
				"id": "v4319",
				"name": "V4319"
			},
			{
				"id": "v4321",
				"name": "V4321"
			}
		]
	},
	{
		"id": "grip",
		"name": "Grip",
		"booths": [
			{
				"id": "1601",
				"name": "1601"
			}
		]
	},
	{
		"id": "guidebook",
		"name": "Guidebook",
		"booths": [
			{
				"id": "1202",
				"name": "1202"
			}
		]
	},
	{
		"id": "hawthorn",
		"name": "Hawthorn",
		"booths": [
			{
				"id": "1305",
				"name": "1305"
			}
		]
	},
	{
		"id": "identilam",
		"name": "IDentilam",
		"booths": [
			{
				"id": "1208a",
				"name": "1208a"
			}
		]
	},
	{
		"id": "immersive-av-supported-by-itr",
		"name": "Immersive AV supported by ITR",
		"booths": [
			{
				"id": "1101",
				"name": "1101"
			}
		]
	},
	{
		"id": "inevent",
		"name": "InEvent",
		"booths": [
			{
				"id": "1203",
				"name": "1203"
			}
		]
	},
	{
		"id": "integra-planner",
		"name": "Integra Planner",
		"booths": [
			{
				"id": "3403",
				"name": "3403"
			}
		]
	},
	{
		"id": "jonas-event-technology",
		"name": "Jonas Event Technology",
		"booths": [
			{
				"id": "1401",
				"name": "1401"
			}
		]
	},
	{
		"id": "kastekust",
		"name": "Kastekust",
		"booths": [
			{
				"id": "1502",
				"name": "1502"
			}
		]
	},
	{
		"id": "lineup-ninja",
		"name": "LineUp Ninja",
		"booths": [
			{
				"id": "1111",
				"name": "1111"
			}
		]
	},
	{
		"id": "linguali",
		"name": "Linguali",
		"booths": [
			{
				"id": "1604",
				"name": "1604"
			}
		]
	},
	{
		"id": "london-audio-visual",
		"name": "London Audio Visual",
		"booths": [
			{
				"id": "1513",
				"name": "1513"
			}
		]
	},
	{
		"id": "noba",
		"name": "Noba",
		"booths": [
			{
				"id": "1508",
				"name": "1508"
			}
		]
	},
	{
		"id": "noonah",
		"name": "Noonah",
		"booths": [
			{
				"id": "3407",
				"name": "3407"
			}
		]
	},
	{
		"id": "noonah-experience-zone",
		"name": "Noonah (Experience Zone)",
		"booths": [
			{
				"id": "3406",
				"name": "3406"
			}
		]
	},
	{
		"id": "novum-av",
		"name": "Novum AV",
		"booths": [
			{
				"id": "1501",
				"name": "1501"
			}
		]
	},
	{
		"id": "one-world-rental",
		"name": "One World Rental",
		"booths": [
			{
				"id": "1107",
				"name": "1107"
			}
		]
	},
	{
		"id": "oneplan",
		"name": "OnePlan",
		"booths": [
			{
				"id": "2103",
				"name": "2103"
			}
		]
	},
	{
		"id": "openaudience",
		"name": "OpenAudience",
		"booths": [
			{
				"id": "1407",
				"name": "1407"
			}
		]
	},
	{
		"id": "ordinate",
		"name": "Ordinate",
		"booths": [
			{
				"id": "1103",
				"name": "1103"
			}
		]
	},
	{
		"id": "pigeonhole-live",
		"name": "Pigeonhole Live",
		"booths": [
			{
				"id": "1503",
				"name": "1503"
			}
		]
	},
	{
		"id": "present-communications-ltd",
		"name": "Present Communications ltd",
		"booths": [
			{
				"id": "1702",
				"name": "1702"
			}
		]
	},
	{
		"id": "pylon-one",
		"name": "Pylon One",
		"booths": [
			{
				"id": "1108",
				"name": "1108"
			}
		]
	},
	{
		"id": "salestratus",
		"name": "SaleStratus",
		"booths": [
			{
				"id": "1204",
				"name": "1204"
			}
		]
	},
	{
		"id": "servicerobotscom",
		"name": "Servicerobots.com",
		"booths": [
			{
				"id": "4105",
				"name": "4105"
			}
		]
	},
	{
		"id": "shocklogic",
		"name": "Shocklogic",
		"booths": [
			{
				"id": "1507",
				"name": "1507"
			}
		]
	},
	{
		"id": "silent-seminars",
		"name": "Silent Seminars",
		"booths": [
			{
				"id": "1603",
				"name": "1603"
			}
		]
	},
	{
		"id": "sinch",
		"name": "Sinch",
		"booths": [
			{
				"id": "2406",
				"name": "2406"
			}
		]
	},
	{
		"id": "smart-av",
		"name": "Smart AV",
		"booths": [
			{
				"id": "1206",
				"name": "1206"
			}
		]
	},
	{
		"id": "splento",
		"name": "Splento",
		"booths": [
			{
				"id": "2507",
				"name": "2507"
			}
		]
	},
	{
		"id": "sprintr-by-av1",
		"name": "Sprintr by av1",
		"booths": [
			{
				"id": "1112",
				"name": "1112"
			}
		]
	},
	{
		"id": "swoogo",
		"name": "Swoogo",
		"booths": [
			{
				"id": "1403",
				"name": "1403"
			}
		]
	},
	{
		"id": "tag-digital",
		"name": "Tag Digital",
		"booths": [
			{
				"id": "3404",
				"name": "3404"
			}
		]
	},
	{
		"id": "the-tekk-group-and-tablet-hire",
		"name": "The Tekk Group & Tablet Hire",
		"booths": [
			{
				"id": "v4200",
				"name": "V4200"
			},
			{
				"id": "v4201",
				"name": "V4201"
			}
		]
	},
	{
		"id": "ticketpass",
		"name": "Ticketpass",
		"booths": [
			{
				"id": "4101",
				"name": "4101"
			}
		]
	},
	{
		"id": "venue-view",
		"name": "Venue View",
		"booths": [
			{
				"id": "2101",
				"name": "2101"
			}
		]
	},
	{
		"id": "venuiq",
		"name": "VenuIQ",
		"booths": [
			{
				"id": "1302",
				"name": "1302"
			}
		]
	},
	{
		"id": "vevox",
		"name": "Vevox",
		"booths": [
			{
				"id": "1311",
				"name": "1311"
			}
		]
	},
	{
		"id": "visit-by-ges",
		"name": "Visit by GES",
		"booths": [
			{
				"id": "1505",
				"name": "1505"
			}
		]
	},
	{
		"id": "visual-hive",
		"name": "Visual Hive",
		"booths": [
			{
				"id": "2507",
				"name": "2507"
			}
		]
	},
	{
		"id": "yumiwi",
		"name": "Yumiwi",
		"booths": [
			{
				"id": "1510",
				"name": "1510"
			}
		]
	},
	{
		"id": "zoho-backstage",
		"name": "Zoho Backstage",
		"booths": [
			{
				"id": "1514",
				"name": "1514"
			}
		]
	}
]
""";
