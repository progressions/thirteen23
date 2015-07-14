# thirteen23

- [ ] The user can sign up with their name (required), username (required), password (required), and location (optional).
- [ ] The user can sign in with their username or email and their password.
- [ ] Once siged in, the user is sent to their profile page (route is /username).
- [ ] The user's profile page shows the user's photo (which should be a 200 x 200 circle png... use a cloudinary transform for this) and location. If the user has not uploaded a photo show the default photo provided in this repo (files/default.png). A user has only one photo.
- [ ] The user can upload a photo on their own profile page (upload controls should be hidden on other user's pages). Uploading, setting the user's photo in the database, and showing the new photo to the user should be done without reloading the page.  [ ] A user can go to any other user's profile page and see their photo.
- [ ] The home page contains a paginated list of links to each user's home page (sorted by join date). Each page should have a maximum of 5 users.
