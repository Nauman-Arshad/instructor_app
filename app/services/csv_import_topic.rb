class CsvImportTopic
  require 'csv'

  def self.call(file, course_id)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    csv.each do
      topic_hash = {}
      topic_hash[:description] = csv["Description"][0]
      topic_hash[:course_id] = course_id
      Topic.find_or_create_by!(topic_hash)
    end
  end
end