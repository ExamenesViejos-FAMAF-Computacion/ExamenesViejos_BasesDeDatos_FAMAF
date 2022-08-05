use company;

db.department.insertMany([
	{
		"_id": 5,
		"name": "Research",
		"manager_emp_id": "333445555",
		"manager_start_date": ISODate("1988-05-22"),
		"locations": [
			"Bellaire", "Sugarland", "Houston"
		]
	},
	{
		"_id": 4,
		"name": "Administration",
		"manager_emp_id": "987654321",
		"manager_start_date": ISODate("1995-01-01"),
		"locations": [
			"Stafford"
		]
	},
	{
		"_id": 1,
		"name": "Headquarters",
		"manager_emp_id": "888665555",
		"manager_start_date": ISODate("1981-06-19"),
		"locations": [
			"Houston"
		]
	}
]);

db.employee.insertMany([
	{
		"_id": '123456789', 
		"name": {
			"first": 'John', 
			"last": 'Smith' 
		},
		"birth_date": ISODate("1965-01-09"), 
		"address": '731 Fondren, Houston, TX',
		"gender": 'M', 
		"title": 'Senior Software Engineer',
		"salary": 30000,
		"boss_emp_no": '333445555', 
		"dept_number": 5,
		"works_on" : [
			{
				"proj_number": 1,
				"hours": 32.5
			},
			{
				"proj_number": 2,
				"hours": 7.5
			}
		]
	},
	{
		"_id": '333445555',
		"name": {
			"first": 'Franklin',
			"last": 'Wong'
		},
		"birth_date": ISODate("1955-12-08"), 
		"address": '638 Voss, Houston, TX',
		"gender": 'M',
		"title": 'Senior Data Engineer',
		"salary": 40000,
		"boss_emp_no": '888665555',
		"dept_number": 5,
		"works_on" : [
			{
				"proj_number": 2,
				"hours": 10.0
			},
			{
				"proj_number": 3,
				"hours": 10.0
			},
			{
				"proj_number": 10,
				"hours": 10.0
			},
			{
				"proj_number": 20,
				"hours": 10.0
			}
		]
	},
	{
		"_id": '999887777',
		"name": {
			"first": 'Alicia',
			"last": 'Zelaya'
		},
		"birth_date": ISODate("1968-01-19"),
		"address": '3321 Castle, Spring, TX',
		"gender": 'F',
		"title": 'Senior Software Engineer',
		"salary": 25000,
		"boss_emp_no": '987654321',
		"dept_number": 4, 
		"works_on" : [
			{
				"proj_number": 30,
				"hours": 30.0
			},
			{
				"proj_number": 10,
				"hours": 10.0
			}
		]
	},
	{
		"_id": '987654321',
		"name": {
			"first": 'Jennifer',
			"last": 'Wallace',
		},
		"birth_date": ISODate("1941-06-20"), 
		"address": '291 Berry, Bellaire, TX',
		"gender": 'F',
		"title": 'Senior Cloud Engineer',
		"salary": 43000,
		"boss_emp_no": '888665555',
		"dept_number": 4,
		"works_on" : [
			{
				"proj_number": 30,
				"hours": 20.0
			},
			{
				"proj_number": 20,
				"hours": 15.0
			}
		]
	},
	{
		"_id": '666884444',
		"name": {
			"first": 'Ramesh',
			"last": 'Narayan'
		},
		"birth_date": ISODate("1962-09-15"), 
		"address": '975 Fire Oak, Humble, TX',
		"gender": 'M',
		"title": 'Senior Software Architect',
		"salary": 38000,
		"boss_emp_no": '333445555',
		"dept_number": 5,
		"works_on" : [
			{
				"proj_number": 3,
				"hours": 40.0
			}
		]
	},
	{
		"_id": '453453453',
		"name": {
			"first": 'Joyce',
			"last": 'English',
		},
		"birth_date": ISODate("1972-07-31"), 
		"address": '5631 Rice, Houston, TX',
		"gender": 'F',
		"title": 'Senior Software Engineer',
		"salary": 25000,
		"boss_emp_no": '333445555',
		"dept_number": 5,
		"works_on" : [
			{
				"proj_number": 1,
				"hours": 20.0
			},
			{
				"proj_number": 2,
				"hours": 20.0
			}
		]
	},
	{
		"_id": '987987987',
		"name": {
			"first": 'Ahmad',
			"last": 'Jabbar'
		},
		"birth_date": ISODate("1969-03-29"),
		"address": '980 Dallas, Houston, TX',
		"gender": 'M',
		"title": 'Senior UI Designer',
		"salary": 25000,
		"boss_emp_no": '987654321',
		"dept_number": 4,
		"works_on" : [
			{
				"proj_number": 10,
				"hours": 35.0
			},
			{
				"proj_number": 30,
				"hours": 5.0
			}
		]
	},
	{
		"_id": '888665555',
		"name": {
			"first": 'James',
			"last": 'Borg'
		},
		"birth_date": ISODate("1937-11-10"), 
		"address": '450 Stone, Houston, TX',
		"gender": 'M',
		"title": 'Senior Cloud Engineer',
		"salary": 55000,
		"boss_emp_no": null,
		"dept_number": 1,
		"works_on" : [
			{
				"proj_number": 20,
				"hours": 0.5
			}
		]
	}
]);

db.project.insertMany([
		{
			"_id": 1,
			"name": 'ProductX',
			"location": 'Bellaire',
			"dept_id": 5
		},
		{
			"_id": 2,
			"name": 'ProductY',
			"location": 'Sugarland',
			"dept_id": 5
		},
		{
			"_id": 3,
			"name": 'ProductZ',
			"location": 'Houston',
			"dept_id": 5
		},
		{
			"_id": 10,
			"name": 'Computerization',
			"location": 'Stafford',
			"dept_id": 4
		},
		{
			"_id": 20,
			"name": 'Reorganization',
			"location": 'Houston',
			"dept_id": 1
		},
		{
			"_id": 30,
			"name": 'Newbenefits',
			"location": 'Stafford',
			"dept_id":  4
		}
]);
