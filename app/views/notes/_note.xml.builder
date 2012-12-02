xml.note("lon" => note.lon, "lat" => note.lat) do
  xml.id note.id
  xml.url note_url(note, :format => params[:format])
  xml.comment_url comment_note_url(note, :format => params[:format])
  xml.close_url close_note_url(note, :format => params[:format])  
  xml.date_created note.created_at
  xml.status note.status

  if note.status == "closed"
    xml.date_closed note.closed_at
  end

  xml.comments do
    note.comments.each do |comment|
      xml.comment do
        xml.date comment.created_at
        xml.uid comment.author.id unless comment.author.nil?
        xml.user comment.author.display_name unless comment.author.nil?
        xml.text comment.body
      end	
    end
  end
end
