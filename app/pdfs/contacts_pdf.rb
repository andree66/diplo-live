class ContactsPDF < Prawn::Document
  def initialize(contact,current_user)
    @contact = contact
    @current_user = current_user
    super()
    body_pdf
  end

  def body_pdf
    stroke_horizontal_rule
    pad(20) do
      text "Certificado de contacto"
    end

    stroke_horizontal_rule
    pad(10) do
      text "#{@contact.name}"
      text "#{@contact.phone}"
      text "#{@contact.email}"
    end
    stroke_horizontal_rule
    pad(20) do
      image "#{@contact.avatar.file.file}"
    end
    text "Este reporte fue creado por #{@current_user.email} a las: #{Time.now}"
  end

end