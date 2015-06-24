class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :picture)
  end

end
# <% @myPooRequests.each do |request| %>
#           <tr>
#             <td><%= request.users.firs_name %></td>
#             <td><%= request.users.last_name %></td>
#             <td><%= request.flats.title %></td>
#             <td><%= request.status %></td>
#           </tr>
#         <% end %>
        # <% @myRequests.each do |request| %>
        #   <tr>
        #     <td><%= request.users.picture %></td>
        #     <td><%= request.users.first_name + ' ' + request.users.last_name %></td>
        #     <td><%= request.flats.title %></td>
        #     <td><%= request.checkin_on %></td>
        #     <td><%= request.status %></td>
        #   </tr>
        # <% end %>
