json.array!(@resumes) do |resume|
  json.extract! resume, :id, :name, :phone, :email, :street, :city, :state, :zip, :summary
  json.url resume_url(resume, format: :json)
end
