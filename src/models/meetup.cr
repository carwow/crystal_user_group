class Meetup < BaseModel

  MEETUP_SCHEMA = { 
    "title"       => String,
    "description" => String,
    "event_date"  => Time,
    "url"         => String 
  }
  
  DB.mapping({{MEETUP_SCHEMA}})

  def self.schema 
    MEETUP_SCHEMA
  end

  def self.table_name    
    "meetups"
  end
end