class GitHubUser {
  String? avatar;
  String? username;
  String? joindate;
  String? bio;
  String? location;
  String? blog;
  String? company;
  String? repos;
  String? followers;
  String? following;
  String? twitter;
  String? email;
  String? id;
  GitHubUser(
      {this.avatar,
      this.username,
      this.joindate,
      this.bio,
      this.location,
      this.blog,
      this.company,
      this.repos,
      this.followers,
      this.following,
      this.twitter,
      this.email,
      this.id});

  GitHubUser.fromJson(Map<String, dynamic> apidata) {
    avatar = apidata['avatar_url'];
    username = apidata['login'];
    joindate = apidata['created_at'];
    bio = apidata['bio'];
    location = apidata['location'];
    blog = apidata['blog'];
    company = apidata['company'];
    repos = apidata['public_repos'].toString();
    followers = apidata['followers'].toString();
    following = apidata['following'].toString();
    twitter = apidata['twitter_username'];
    email = apidata['email'];
    id = apidata['id'].toString();
  }
}
