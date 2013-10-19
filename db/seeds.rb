titles = %q(
  Entrepreneurs
  Executives
  Investors
  Lawyers
  Investment Bankers
  Consultants
  Faculty
  Philanthropists
)

titles.split("\n").each do |title|
  title = title.strip
  next unless title.present?
  Tag.find_or_create_by(title: title)
end
