class QuickAccessCardEntities {
  String? title;
  String? image;
  bool? permission;
  Function? onTap;
  Function? onPlayButtonTap;

  QuickAccessCardEntities(
      {this.title,
        this.image,
        this.onTap,
        this.permission,
        this.onPlayButtonTap});
}
