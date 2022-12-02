# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	BloomTaxonomyLevel::BLOOM_TAXONOMY_LEVEL.each do |level_name|
		BloomTaxonomyLevel.create(level: level_name)
	end

	BloomTaxonomyVerb.destroy_all
	BloomTaxonomyVerb.create!([{
		name: "Arrange", bloom_taxonomy_level_id: 1
	},
	{
		name: "Choose", bloom_taxonomy_level_id: 1
	},
	{
		name: "Count", bloom_taxonomy_level_id: 1
	},{
		name: "Define", bloom_taxonomy_level_id: 1
	},{
		name: "Describe", bloom_taxonomy_level_id: 1
	},{
		name: "Draw", bloom_taxonomy_level_id: 1
	},{
		name: "Duplicate", bloom_taxonomy_level_id: 1
	},{
		name: "Identify", bloom_taxonomy_level_id: 1
	},{
		name: "Label", bloom_taxonomy_level_id: 1
	},{
		name: "List", bloom_taxonomy_level_id: 1
	},{
		name: "Locate", bloom_taxonomy_level_id: 1
	},{
		name: "Match", bloom_taxonomy_level_id: 1
	},{
		name: "Memorize", bloom_taxonomy_level_id: 1
	},{
		name: "Name", bloom_taxonomy_level_id: 1
	},{
		name: "Omit", bloom_taxonomy_level_id: 1
	},{
		name: "Order", bloom_taxonomy_level_id: 1
	},{
		name: "Outline", bloom_taxonomy_level_id: 1
	},{
		name: "Point", bloom_taxonomy_level_id: 1
	},{
		name: "Quote", bloom_taxonomy_level_id: 1
	},
	{
		name: "Associate", bloom_taxonomy_level_id: 2
	},
	{
		name: "Classify", bloom_taxonomy_level_id: 2
	},{
		name: "Computer", bloom_taxonomy_level_id: 2
	},{
		name: "Convert", bloom_taxonomy_level_id: 2
	},{
		name: "Defend", bloom_taxonomy_level_id: 2
	},{
		name: "Demonstrate", bloom_taxonomy_level_id: 2
	},{
		name: "Describe", bloom_taxonomy_level_id: 2
	},{
		name: "Distinguish", bloom_taxonomy_level_id: 2
	},{
		name: "Estimate", bloom_taxonomy_level_id: 2
	},{
		name: "Explain", bloom_taxonomy_level_id: 2
	},{
		name: "Express", bloom_taxonomy_level_id: 2
	},{
		name: "Extend", bloom_taxonomy_level_id: 2
	},{
		name: "Extrapolate", bloom_taxonomy_level_id: 2
	},{
		name: "Generalize", bloom_taxonomy_level_id: 2
	},{
		name: "Give Examples", bloom_taxonomy_level_id: 2
	},{
		name: "Identify", bloom_taxonomy_level_id: 2
	},{
		name: "Illustrate", bloom_taxonomy_level_id: 2
	},{
		name: "Indicate", bloom_taxonomy_level_id: 2
	},{
		name: "Add", bloom_taxonomy_level_id: 3
	},
	{
		name: "Apply", bloom_taxonomy_level_id: 3
	},{
		name: "Calculate", bloom_taxonomy_level_id: 3
	},{
		name: "Change", bloom_taxonomy_level_id: 3
	},{
		name: "Choose", bloom_taxonomy_level_id: 3
	},{
		name: "Classify", bloom_taxonomy_level_id: 3
	},{
		name: "Complete", bloom_taxonomy_level_id: 3
	},{
		name: "Compute", bloom_taxonomy_level_id: 3
	},{
		name: "Demonstrate", bloom_taxonomy_level_id: 3
	},{
		name: "Discover", bloom_taxonomy_level_id: 3
	},{
		name: "Divide", bloom_taxonomy_level_id: 3
	},{
		name: "Dramatize", bloom_taxonomy_level_id: 3
	},{
		name: "Employ", bloom_taxonomy_level_id: 3
	},{
		name: "Examine", bloom_taxonomy_level_id: 3
	},{
		name: "Explain", bloom_taxonomy_level_id: 3
	},{
		name: "Generalize", bloom_taxonomy_level_id: 3
	},{
		name: "Graph", bloom_taxonomy_level_id: 3
	},{
		name: "Illustrate", bloom_taxonomy_level_id: 3
	},{
		name: "Interpret", bloom_taxonomy_level_id: 3
	},{
		name: "Analyze", bloom_taxonomy_level_id: 4
	},
	{
		name: "Appraise", bloom_taxonomy_level_id: 4
	},{
		name: "Arrange", bloom_taxonomy_level_id: 4
	},{
		name: "Breakdown", bloom_taxonomy_level_id: 4
	},{
		name: "Calculate", bloom_taxonomy_level_id: 4
	},{
		name: "Categorize", bloom_taxonomy_level_id: 4
	},{
		name: "Classify", bloom_taxonomy_level_id: 4
	},{
		name: "Combine", bloom_taxonomy_level_id: 4
	},{
		name: "Compare", bloom_taxonomy_level_id: 4
	},{
		name: "Contrast", bloom_taxonomy_level_id: 4
	},{
		name: "Criticize", bloom_taxonomy_level_id: 4
	},{
		name: "Design", bloom_taxonomy_level_id: 4
	},{
		name: "Detect", bloom_taxonomy_level_id: 4
	},{
		name: "Develop", bloom_taxonomy_level_id: 4
	},{
		name: "Diagram", bloom_taxonomy_level_id: 4
	},{
		name: "Differentiate", bloom_taxonomy_level_id: 4
	},{
		name: "Discriminate", bloom_taxonomy_level_id: 4
	},{
		name: "Distinguish", bloom_taxonomy_level_id: 4
	},{
		name: "Examine", bloom_taxonomy_level_id: 4
	},{
		name: "Appraise", bloom_taxonomy_level_id: 5
	},{
		name: "Argue", bloom_taxonomy_level_id: 5
	},{
		name: "Assess", bloom_taxonomy_level_id: 5
	},
	{
		name: "Attach", bloom_taxonomy_level_id: 5
	},{
		name: "Choose", bloom_taxonomy_level_id: 5
	},{
		name: "Compare", bloom_taxonomy_level_id: 5
	},{
		name: "Conclude", bloom_taxonomy_level_id: 5
	},{
		name: "Contrast", bloom_taxonomy_level_id: 5
	},{
		name: "Critique", bloom_taxonomy_level_id: 5
	},{
		name: "Defend", bloom_taxonomy_level_id: 5
	},{
		name: "Determine", bloom_taxonomy_level_id: 5
	},{
		name: "Estimate", bloom_taxonomy_level_id: 5
	},{
		name: "Evaluate", bloom_taxonomy_level_id: 5
	},{
		name: "Explain", bloom_taxonomy_level_id: 5
	},{
		name: "Grade", bloom_taxonomy_level_id: 5
	},
	{
		name: "Judge", bloom_taxonomy_level_id: 5
	},{
		name: "Arrange", bloom_taxonomy_level_id: 6
	},
	{
		name: "Assemble", bloom_taxonomy_level_id: 6
	},{
		name: "Categorize", bloom_taxonomy_level_id: 6
	},{
		name: "Choose", bloom_taxonomy_level_id: 6
	},{
		name: "Collect", bloom_taxonomy_level_id: 6
	},{
		name: "Combine", bloom_taxonomy_level_id: 6
	},{
		name: "Compile", bloom_taxonomy_level_id: 6
	},{
		name: "Comply", bloom_taxonomy_level_id: 6
	},{
		name: "Compose", bloom_taxonomy_level_id: 6
	},{
		name: "Construct", bloom_taxonomy_level_id: 6
	},{
		name: "Create", bloom_taxonomy_level_id: 6
	},{
		name: "Design", bloom_taxonomy_level_id: 6
	},
	{
		name: "Develop", bloom_taxonomy_level_id: 6
	},{
		name: "Devise", bloom_taxonomy_level_id: 6
	},{
		name: "Do", bloom_taxonomy_level_id: 6
	},{
		name: "Derive", bloom_taxonomy_level_id: 6
	},
	{
		name: "Explain", bloom_taxonomy_level_id: 6
	},{
		name: "Formulate", bloom_taxonomy_level_id: 6
	},
	{
		name: "Generate", bloom_taxonomy_level_id: 6
	}
])
	p "Seeding"


