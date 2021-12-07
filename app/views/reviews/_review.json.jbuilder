json.extract! review, :id, :star_rating, :review_text, :teacher_id,
              :student_id, :created_at, :updated_at
json.url review_url(review, format: :json)
