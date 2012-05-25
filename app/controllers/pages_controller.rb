class PagesController < HighVoltage::PagesController
  def show
    case params[:id]
    when 'homepage'
      if current_user.signed_in?
        redirect_to todos_path
      else
        render :homepage
      end
    end
  end
end
