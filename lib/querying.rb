def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year
  FROM Books
  JOIN Series ON Books.series_id = Series.id
  WHERE Series.id = 1
  ORDER BY Books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto
  FROM Characters
  ORDER BY LENGTH(Characters.motto) DESC
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT Characters.species, COUNT(Characters.id)
  FROM Characters
  GROUP BY Characters.species
  ORDER BY COUNT(Characters.id) DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM Series
  LEFT JOIN Authors ON Series.author_id = Authors.id
  LEFT JOIN Subgenres ON Series.subgenre_id = Subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Characters
  LEFT JOIN character_books ON character_books.character_id = Characters.id
  LEFT JOIN Books ON character_books.book_id = Books.id
  LEFT JOIN Series ON Books.series_id = Series.id
  WHERE Characters.species = 'human'
  GROUP BY Series.title
  ORDER BY COUNT(Characters.id) DESC
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(Books.title) book_count
  FROM Characters
  LEFT JOIN character_books ON character_books.character_id = Characters.id
  LEFT JOIN Books ON character_books.book_id = Books.id
  GROUP BY Characters.name
  ORDER BY book_count DESC, Characters.name;"
end
