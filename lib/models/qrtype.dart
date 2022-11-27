import "package:hive/hive.dart";

part "qrtype.g.dart";

@HiveType(typeId: 1)
enum QRType {
  @HiveField(0)
  text,
  @HiveField(1)
  url,
  @HiveField(2)
  email,
  @HiveField(3)
  phone,
  @HiveField(4)
  sms,
  @HiveField(5)
  wifi,
  @HiveField(6)
  geo,
  @HiveField(7)
  contact,
  @HiveField(8)
  calendar,
  @HiveField(9)
  unknown,
  @HiveField(10)
  instagram,
  @HiveField(11)
  facebook,
  @HiveField(12)
  twitter,
  @HiveField(13)
  linkedin,
  @HiveField(14)
  youtube,
  @HiveField(15)
  github,
  @HiveField(16)
  twitch,
}

const stringQRType = {
  QRType.text: "Text",
  QRType.url: "Website",
  QRType.email: "Email",
  QRType.phone: "Phone",
  QRType.sms: "Message",
  QRType.wifi: "Wi-Fi",
  QRType.geo: "Location",
  QRType.contact: "Contact",
  QRType.calendar: "Calendar",
  QRType.unknown: "Unknown",
  QRType.instagram: "Instagram",
  QRType.facebook: "Facebook",
  QRType.twitter: "Twitter",
  QRType.linkedin: "LinkedIn",
  QRType.youtube: "YouTube",
  QRType.github: "GitHub",
  QRType.twitch: "Twitch",
};
