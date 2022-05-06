class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    unless @user
      redirect_to root_url, alert: "User not found"
    end # zobacz jak to zrobic zeby nie throwowalo errora albo zeby to moglo wejsc tylko na swoj profajl???
    # zobacz na blogu jak to zrobiles zeby nie throwowalo erorr
  end
end
