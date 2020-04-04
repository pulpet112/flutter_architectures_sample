abstract class SocialMediaEvent {}

class CheckboxChecked extends SocialMediaEvent {
  final bool isChecked;
  final int itemId;

  CheckboxChecked(this.isChecked, this.itemId);
}