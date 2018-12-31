# To-do list
x Filtering by reading time, rating, hashtags, ... on articles page [using Randstack]
--> update: filtering basic on index page done; to-do is filtering by average rating, filtering on non-index page and hide/show filters beyond hashtag
x searching on all pages with printed articles (also hashtags, articles, publishers, favorites, bookmarks)
x user page
--> update: done
x index view for publishers, favorites and hashtags
x log-in page (make it appealing)
x groups
x share articles with individual people only
--> update: link with whatsapp, so private messages or platform-specific groups are not required
x public/private profiles
x follow (other users, potentially topics, authors and sources)
x video presentation; beyond Youtube
x log in with Facebook?
x when typing hashtags, give Instagram-style preview of existing tags (with html datalist)
x use JS ajax to not re-load pages when action is executed
x change to multi-view (many posts in a screen, e.g. 2x4)

<!-- social media -->
        <% if @user_profile.fb_account.present? %>
          <a href="<%=@user_profile.fb_account%>"><i class="fab fa-facebook" style="color:blue"></i></a>
        <% else %>
          <a><i class="fab fa-facebook" style="color:lightgrey"></i></a>
        <% end %>
        <% if @user_profile.twitter_account.present? %>
          <a href="<%=@user_profile.twitter_account%>"><i class="fab fa-twitter"></i></a>
        <% else %>
          <a><i class="fab fa-twitter" style="color:lightgrey"></i></a>
        <% end %>
        <% if @user_profile.linkedin_account.present? %>
          <a href="<%=@user_profile.linkedin_account%>"><i class="fab fa-linkedin" style="color:blue"></i></a>
        <% else %>
          <a><i class="fab fa-linkedin" style="color:lightgrey"></i></a>
        <% end %>
        <% if @user_profile.medium_account.present? %>
          <a href="<%=@user_profile.medium_account%>"><i class="fab fa-medium" style="color:black"></i></a>
        <% else %>
          <a><i class="fab fa-medium" style="color:lightgrey"></i></a>
        <% end %><br/>