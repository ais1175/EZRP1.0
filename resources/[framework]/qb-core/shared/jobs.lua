QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 10
            },
        },
	},
	['police'] = {
		label = 'Los Santos Police Department',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadets',
                payment = 100
            },
			['1'] = {
                name = 'Officers',
                payment = 175
            },
			['2'] = {
                name = 'Supervisiors',
                payment = 1000
            },
			['3'] = {
                name = 'Comamand',
                payment = 1025
            },
			['4'] = {
                name = 'High-Command',
				isboss = true,
                payment = 1500
            },
            ['5'] = {
                name = 'Chief',
				isboss = true,
                payment = 2500
            },
        },
	},
    ['state'] = {
		label = 'San Andreas State Troopers',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadets',
                payment = 100
            },
			['1'] = {
                name = 'Troopers',
                payment = 175
            },
			['2'] = {
                name = 'Supervisiors',
                payment = 1000
            },
			['3'] = {
                name = 'Command',
                payment = 1025
            },
			['4'] = {
                name = 'High-Command',
				isboss = true,
                payment = 1500
            },
            ['5'] = {
                name = 'Colonel',
				isboss = true,
                payment = 2500
            },
        },
	},
    ['bcso'] = {
		label = 'Blane County Sheriffs Office',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadets',
                payment = 100
            },
			['1'] = {
                name = 'Deputy',
                payment = 175
            },
			['2'] = {
                name = 'Supervisiors',
                payment = 1000
            },
			['3'] = {
                name = 'Command',
                payment = 1025
            },
			['4'] = {
                name = 'High-Command',
				isboss = true,
                payment = 1500
            },
            ['5'] = {
                name = 'Sherrif',
				isboss = true,
                payment = 2500
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
        type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Paramedic',
                payment = 75
            },
			['2'] = {
                name = 'Doctor',
                payment = 100
            },
			['3'] = {
                name = 'Surgeon',
                payment = 125
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                payment = 150
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
    ['burgershot'] = {
        label = 'Burgershot',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    
    ['catcafe'] = {
        label = 'UwU Cafe',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    
    ['pizza'] = {
        label = 'Pizzaria',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    
    ['beanmachine'] = {
        label = 'Bean Machine',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    
    ['vu'] = {
        label = 'Strip Club',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 75
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 100
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 150
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 200
            },
        },
    },
    
    ['henhouse'] = {
        label = 'Hen House',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },

    ["cookies"] = {
		label = "Cookies Weed Shop",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Employee",
                payment = 75
            },
			['1'] = {
                name = "Manager",
                payment = 150
            },
			['2'] = {
                name = "Boss",
				isboss = true,
                payment = 250
            },
        },
	},
    ["hookies"] = {
		label = "Hookies Diner",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Employee",
                payment = 75
            },
			['1'] = {
                name = "Manager",
                payment = 150
            },
			['2'] = {
                name = "Bossman",
				isboss = true,
                payment = 250
            },
        },
	},
    ['pizza'] = {
        label = 'Pizzaria',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['tequilala'] = {
        label = 'Tequilala',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['popsdiner'] = {
        label = 'Pops Diner',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['yellowjack'] = {
        label = 'Yellow Jack',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['taco'] = {
        label = 'Taco Farmer',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ["pegasus"] = {
		label = "Pegasus Inc.",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Keyholders",
                payment = 0
            },
            ['1'] = {
                name = "Employees",
                payment = 250
            },
			['2'] = {
                name = "Executives",
                payment = 490
            },
			['3'] = {
                name = "Bigman",
				isboss = true,
                payment = 1500
            },
        },
	},
    ["mayor"] = {
		label = "Los Santos Mayors Office",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Media Counsil",
                payment = 760
            },
            ['1'] = {
                name = "Judge",
                payment = 1200
            },
            ['2'] = {
                name = "Justice",
                payment = 1000
            },
            ['3'] = {
                name = "Chief Justice",
                payment = 1000
            },
			['4'] = {
                name = "Deputy Mayor",
                payment = 1000
            },
			['5'] = {
                name = "Mayor",
				isboss = true,
                payment = 3500
            },
            ['6'] = {
                name = "Senator",
				isboss = true,
                payment = 3500
            },
        },
	},
}

exports("GetSharedJobs", function()
    return QBShared.Jobs
end)

exports("GetSharedJob", function(job)
    if not QBShared.Jobs[job] then return false end
    return QBShared.Jobs[job]
end)